//
//  CreditcardTableViewCell.m
//  FOMO
//
//  Created by admin on 10/30/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "CreditcardTableViewCell.h"

@interface CreditcardTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *cardTitle;
@property (weak, nonatomic) IBOutlet UILabel *cardExpiry;
@property (weak, nonatomic) IBOutlet UIView *cardPicture;

@end

@implementation CreditcardTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}


@end
