//
//  LoginViewController.m
//  FOMO
//
//  Created by admin on 11/20/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "PersistManager.h"
#import "SignupViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIView *loginClusterView;
@property (weak, nonatomic) IBOutlet UITextView *textDisplay;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self styleViews];
}

- (void)styleViews {
    self.loginClusterView.alpha = 0.0f;
    self.signUpButton.layer.cornerRadius = self.signUpButton.bounds.size.height/2;
    self.loginButton.layer.cornerRadius = self.loginButton.bounds.size.height/2;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    UIImageView *imgOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    imgOne.image = [UIImage imageNamed:@"Slide 1"];
    UIImageView *imgTwo = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth, screenHeight)];
    imgTwo.image = [UIImage imageNamed:@"Slide 2"];
    UIImageView *imgThree = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*2, 0, screenWidth, screenHeight)];
    imgThree.image = [UIImage imageNamed:@"Slide 3"];
    [self.scrollView addSubview:imgOne];
    [self.scrollView addSubview:imgTwo];
    [self.scrollView addSubview:imgThree];
    self.scrollView.contentSize = CGSizeMake(screenWidth*3, screenHeight);
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    self.scrollView.delegate = self;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:1 green:130.0/255.0 blue:0 alpha:1];
    self.textDisplay.layer.shadowColor = [[UIColor blackColor] CGColor];;
    self.textDisplay.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.textDisplay.layer.shadowOpacity = 1.0f;
    self.textDisplay.text = NSLocalizedString(@"Avoid the fear of missing out, with the revolutionary new payment app! The need to fumble around with pin numbers and cash is over!", nil);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    self.pageControl.currentPage = (NSInteger)currentPage;
    if (currentPage == 0){
        self.textDisplay.text = NSLocalizedString(@"Avoid the fear of missing out, with the revolutionary new payment app! The need to fumble around with pin numbers and cash is over!", nil);
    } else if (currentPage == 1) {
        self.textDisplay.text = NSLocalizedString(@"Featuring the newest cutting edge interface, this app is guaranteed to blow you away. Now, sit back, relax, and have a drink!", nil);
        [self animateOutButtons];
    } else if (currentPage == 2) {
        [self animateInButtons];
    }
}

- (void)animateOutButtons {
    [UIView animateWithDuration:0.5 animations:^{
        self.loginClusterView.alpha = 0.0f;
        self.textDisplay.alpha = 1.0f;
    }];
}

- (void)animateInButtons {
    [UIView animateWithDuration:0.5 animations:^{
        self.loginClusterView.alpha = 1.0f;
        self.textDisplay.alpha = 0.0f;
    }];
}

- (IBAction)signUpButtonTapped:(id)sender {
    SignupViewController *viewController = [[SignupViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:NULL];
}

- (IBAction)logInButtonTapped:(id)sender {
    PersistManager *persist = [[PersistManager alloc] init];
    User *potentialUser = [persist returnUserForKey:self.usernameField.text];
    if (potentialUser.password != nil || potentialUser.username != nil || self.passwordField.text == potentialUser.password) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"yes" forKey:@"didILogIn"];
        [defaults synchronize];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MainViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:vc animated:YES completion:NULL];
    };
}

@end
