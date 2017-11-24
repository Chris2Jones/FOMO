//
//  SignupViewController.m
//  FOMO
//
//  Created by admin on 11/20/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "SignupViewController.h"
#import "User.h"
#import "PersistManager.h"

@interface SignupViewController ()

@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIView *nameView;
@property (weak, nonatomic) IBOutlet UIView *emailView;
@property (weak, nonatomic) IBOutlet UIView *usernameView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *ageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation SignupViewController

- (instancetype)init {
    self = [super initWithNibName:@"SignupViewController" bundle:nil];
    if (self != nil)
    {
        // Further initialization if needed
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle {
    NSAssert(NO, @"Initialize with -init");
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self styleViews];
    [self styleButtons];
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

- (void)styleViews {
    self.nameView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.emailView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.usernameView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.passwordView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.ageView.layer.borderColor = [[UIColor grayColor] CGColor];
    
    self.nameView.layer.cornerRadius = 5;
    self.emailView.layer.cornerRadius = 5;
    self.usernameView.layer.cornerRadius = 5;
    self.passwordView.layer.cornerRadius = 5;
    self.ageView.layer.cornerRadius = 5;
    
    self.nameView.layer.borderWidth = 1;
    self.emailView.layer.borderWidth = 1;
    self.usernameView.layer.borderWidth = 1;
    self.passwordView.layer.borderWidth = 1;
    self.ageView.layer.borderWidth = 1;
}

- (void)styleButtons {
    self.registerButton.layer.cornerRadius = self.registerButton.bounds.size.height/2;
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerButtonTapped:(id)sender {
    User *user = [[User alloc]init];
    user.name = self.nameTextField.text;
    user.email = self.emailTextField.text;
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    user.age = self.ageTextField.text;
    PersistManager *persist = [[PersistManager alloc] init];
    [persist saveUser:user ForKey:self.usernameTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
