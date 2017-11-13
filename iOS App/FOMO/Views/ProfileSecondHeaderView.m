//
//  ProfileSecondHeaderView.m
//  FOMO
//
//  Created by admin on 11/6/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "ProfileSecondHeaderView.h"

@interface ProfileSecondHeaderView ()
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation ProfileSecondHeaderView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self addSubview:
         [[[NSBundle mainBundle] loadNibNamed:@"ProfileSecondHeaderView"
                                        owner:self
                                      options:nil] objectAtIndex:0]];
        [self styleViews];
    }
    return self;
}

- (void)styleViews{
    [self.backgroundView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 70)];
}

@end
