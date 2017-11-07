//
//  ProfileHeaderView.m
//  FOMO
//
//  Created by admin on 11/5/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "ProfileHeaderView.h"

@interface ProfileHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *profileImage;

@end

@implementation ProfileHeaderView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self addSubview:
         [[[NSBundle mainBundle] loadNibNamed:@"ProfileHeaderView"
                                        owner:self
                                      options:nil] objectAtIndex:0]];
        [self styleViews];
    }
    return self;
}

- (void)styleViews{
    self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height/2;
    [self.backgroundView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 130)];
}

@end
