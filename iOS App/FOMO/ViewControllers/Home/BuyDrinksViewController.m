//
//  BuyDrinksViewController.m
//  FOMO
//
//  Created by admin on 10/25/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "BuyDrinksViewController.h"

@interface BuyDrinksViewController ()

@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIImageView *imgQRCode;
@property (weak, nonatomic) IBOutlet UIButton *btnAction;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *pickerButton;
@property (strong) NSArray *pickerData;

@end

@implementation BuyDrinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self styleButtons];
    [self styleViews];
    [self setupPicker];
}

- (void)setupHeader {
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

- (void)setupPicker {
    self.pickerData = @[@"Budweiser", @"Guiness", @"Corona", @"Boneshaker", @"1664 Kronenbourg", @"Stella Artois"];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

- (void)styleButtons {
    self.btnAction.layer.cornerRadius = self.btnAction.bounds.size.height/2;
    self.pickerButton.layer.cornerRadius = self.pickerButton.bounds.size.height/2;
}

- (void)styleViews {
    self.backgroundView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    self.backgroundView.alpha = 0.0f;
}

- (IBAction)pickerButtonTapped:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        self.backgroundView.alpha = 0.0f;
    }];
    NSInteger row = [self.pickerView selectedRowInComponent:0];
    NSString *stringToEncode = NSLocalizedString([self.pickerData objectAtIndex:row], nil);
    CIImage *qrCode = [self createQRForString:stringToEncode];
    UIImage *qrCodeImg = [self createNonInterpolatedUIImageFromCIImage:qrCode withScale:2*[[UIScreen mainScreen] scale]];
    self.imgQRCode.image = qrCodeImg;
}

- (IBAction)performButtonAction:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundView.transform = CGAffineTransformIdentity;
        self.backgroundView.alpha = 1.0f;
    }];
}

- (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image withScale:(CGFloat)scale {
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:image fromRect:image.extent];
    UIGraphicsBeginImageContext(CGSizeMake(image.extent.size.width * scale, image.extent.size.width * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    return scaledImage;
}

- (CIImage *)createQRForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    return qrFilter.outputImage;
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];
}

@end
