//
//  AddFundsViewController.h
//  FOMO
//
//  Created by admin on 10/25/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddFundsViewControllerDelegate;

@interface AddFundsViewController : UIViewController

@property (nonatomic, weak) id<AddFundsViewControllerDelegate> delegate;

- (IBAction)confirmButtonTapped:(id)sender;

@end

@protocol AddFundsViewControllerDelegate <NSObject>

- (void)addFundsViewController:(AddFundsViewController*)viewController
                didChooseValue:(CGFloat)value;
@end
