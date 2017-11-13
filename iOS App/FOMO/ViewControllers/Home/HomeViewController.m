//
//  HomeViewController.h
//  FOMO
//
//  Created by admin on 10/24/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    NSArray *pickerData;
}
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UILabel *fundDisplay;
@property (weak, nonatomic) IBOutlet UIView *fundDisplayView;
@property (weak, nonatomic) IBOutlet UIButton *lockFundButton;
@property (weak, nonatomic) IBOutlet UIButton *addFundButton;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UIView *pickerBackgroundView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *pickerViewDone;
@property (weak, nonatomic) IBOutlet UIButton *pickerViewClose;
@property (weak, nonatomic) IBOutlet UIButton *buyDrinks;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self setupFundDisplayView];
    [self setupButtons];
    [self setupPicker];
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

- (void)setupFundDisplayView {
    self.fundDisplayView.layer.borderWidth = 1;
    self.fundDisplayView.layer.borderColor = [UIColor blackColor].CGColor;
    self.fundDisplayView.layer.cornerRadius = 5;
}

- (void)setupButtons {
    self.lockFundButton.layer.cornerRadius = self.lockFundButton.bounds.size.height/2;
    self.addFundButton.layer.cornerRadius = self.addFundButton.bounds.size.height/2;
    self.addFundButton.layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:130.0/255.0 blue:0.0/255.0 alpha:1].CGColor;
    self.addFundButton.layer.borderWidth = 1;
    self.buyDrinks.layer.cornerRadius = 5;
}

- (void)setupPicker{
    self.pickerBackgroundView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    self.pickerBackgroundView.hidden = YES;
    self.pickerBackgroundView.alpha = 0.0;
    self.pickerViewDone.layer.cornerRadius = self.pickerViewDone.bounds.size.height/2;
    pickerData = @[@"Ale House", @"The Brass", @"The Mansion", @"Clark Hall Pub", @"Queens Pub", @"The Brooklyn"];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

- (IBAction)lockFundsButton:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Do you want to do this?" message:@"Locking funds will not allow you to add funds until 6:00am" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmButton = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        self.fundDisplayView.backgroundColor = [UIColor grayColor];
        self.lockFundButton.alpha = 0.5;
        self.lockFundButton.enabled = NO;
    }];
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelButton];
    [alert addAction:confirmButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)closePickerTapped:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerBackgroundView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        self.pickerBackgroundView.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.pickerBackgroundView.hidden = YES;
    }];
}

- (IBAction)donePickerTapped:(id)sender {
    NSInteger row = [self.pickerView selectedRowInComponent:0];
    [self.barButton setTitle:[pickerData objectAtIndex:row] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerBackgroundView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        self.pickerBackgroundView.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.pickerBackgroundView.hidden = YES;
    }];
}


- (IBAction)barPickerTapped:(id)sender {
    [self.view bringSubviewToFront:self.pickerBackgroundView];
    [UIView animateWithDuration:0.3 animations:^{
        self.pickerBackgroundView.transform = CGAffineTransformIdentity;
        self.pickerBackgroundView.hidden = NO;
        self.pickerBackgroundView.alpha = 1.0;
    }];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}


@end