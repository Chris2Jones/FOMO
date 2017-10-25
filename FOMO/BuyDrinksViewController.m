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

@end

@implementation BuyDrinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
