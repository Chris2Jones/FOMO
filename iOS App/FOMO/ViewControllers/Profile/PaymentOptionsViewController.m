//
//  PaymentOptionsViewController.m
//  FOMO
//
//  Created by admin on 11/6/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "PaymentOptionsViewController.h"

@interface PaymentOptionsViewController ()
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UITextField *billingNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *expiryTextField;
@property (weak, nonatomic) IBOutlet UIButton *addYourCardButton;



@end

@implementation PaymentOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self setupViews];
    [self setupListeners];
}

- (void)setupListeners {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.billingNameTextField resignFirstResponder];
    [self.cardNumberTextField resignFirstResponder];
    [self.expiryTextField resignFirstResponder];
}

- (void)setupViews {
    self.addYourCardButton.layer.cornerRadius = self.addYourCardButton.bounds.size.height/2;
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    [self.view bringSubviewToFront:self.header];
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
