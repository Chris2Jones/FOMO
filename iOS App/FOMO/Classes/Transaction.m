//
//  Transaction.m
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "Transaction.h"
#import "User.h"
#import "Business.h"

@interface Transaction ()

@property (strong, nonatomic) User *payer;
@property (strong, nonatomic) Business *payee;
@property (nonatomic) NSInteger *amount;

@end

@implementation Transaction

@end
