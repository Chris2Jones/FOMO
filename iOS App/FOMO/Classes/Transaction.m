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

@end

@implementation Transaction

- (void) intializeT:(NSString* )tPayer withPayee:(NSString*)tPayee withAmount:(float) tAmount{
    self.payer = tPayer;
    self.payee = tPayee;
    self.amount = tAmount;
}

@end
