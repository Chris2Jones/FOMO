//
//  SplashViewController.m
//  FOMO
//
//  Created by admin on 11/18/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "SplashViewController.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface SplashViewController ()

@property (weak, nonatomic) IBOutlet UILabel *fLetter;
@property (weak, nonatomic) IBOutlet UILabel *firstO;
@property (weak, nonatomic) IBOutlet UILabel *mLetter;
@property (weak, nonatomic) IBOutlet UILabel *secondO;
@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self animteBackground];
}

- (void)setupView {
    self.fLetter.alpha = 0.0f;
    self.firstO.alpha = 0.0f;
    self.mLetter.alpha = 0.0f;
    self.secondO.alpha = 0.0f;
}

- (void)animteBackground {
    [UIView animateWithDuration:1.4 animations:^{
        self.view.backgroundColor = [UIColor cyanColor];
    } completion:^(BOOL finished) {
        [self animateLogo];
    }];
}

- (void)animateLogo {
    [UIView animateWithDuration:0.7 animations:^{
        self.fLetter.alpha = 1.0f;
        self.view.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.7 animations:^{
            self.firstO.alpha = 1.0f;
            self.view.backgroundColor = [UIColor magentaColor];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.7 animations:^{
                self.mLetter.alpha = 1.0f;
                self.view.backgroundColor = [UIColor redColor];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.7 animations:^{
                    self.secondO.alpha = 1.0f;
                    self.view.backgroundColor = [UIColor colorWithRed:1 green:130.0/255.0 blue:0 alpha:1];
                } completion:^(BOOL finished) {
                    [self loadRootViewController];
                }];
            }];
        }];
    }];
}

- (void)loadRootViewController {
    [NSThread sleepForTimeInterval:0.5];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
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
