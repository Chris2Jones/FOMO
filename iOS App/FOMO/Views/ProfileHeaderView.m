//
//  ProfileHeaderView.m
//  FOMO
//
//  Created by admin on 11/5/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "ProfileHeaderView.h"
#import "PersistManager.h"
#import "User.h"

@interface ProfileHeaderView ()

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileName;

@end

@implementation ProfileHeaderView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self addSubview:
         [[[NSBundle mainBundle] loadNibNamed:@"ProfileHeaderView"
                                        owner:self
                                      options:nil] objectAtIndex:0]];
        [self styleViews];
        [self setUser];
    }
    return self;
}

- (void)setUser {
    PersistManager *persistManager = [[PersistManager alloc] init];
    User *user = [[User alloc] init];
    user = [persistManager returnUserForKey:@"asdf"];
    self.profileName.text = user.name;
}

- (void)styleViews{
    self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height/2;
    [self.backgroundView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 130)];
    
    
}

@end
