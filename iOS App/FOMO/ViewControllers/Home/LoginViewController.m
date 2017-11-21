//
//  LoginViewController.m
//  FOMO
//
//  Created by admin on 11/20/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIView *loginClusterView;

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
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    self.pageControl.currentPage = (NSInteger)currentPage;
    if (currentPage == 0){
        [self animateOutButtons];
    } else if (currentPage == 1) {
        [self animateOutButtons];
    } else if (currentPage == 2) {
        [self animateInButtons];
    }
}

- (void)animateOutButtons {
    [UIView animateWithDuration:0.5 animations:^{
        self.loginClusterView.alpha = 0.0f;
    }];
}

- (void)animateInButtons {
    [UIView animateWithDuration:0.5 animations:^{
        self.loginClusterView.alpha = 1.0f;
    }];
}

- (IBAction)signUpButtonTapped:(id)sender {
    [self setUserData];
}

-(void)setUserData {
    User *loginUser = [[User alloc]init];
    loginUser.loginCredentials = self.usernameField.text;
    loginUser.password = self.passwordField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
