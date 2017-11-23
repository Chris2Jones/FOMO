//
//  Business.m
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "Business.h"
#import "Drinks.h"

@interface Business ()

@end

@implementation Business

- (void)addInfo:(NSString *)bName withEmail:(NSString *)bEmail withAddress:(NSString *)bAddress {
    self.email = bEmail;
    self.name = bName;
    self.address = bAddress;
}

- (void)addToTab:(float)amount{
    self.bankInfo = self.bankInfo + amount;
}

@end
