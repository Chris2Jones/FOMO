//
//  Drinks.m
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "Drinks.h"

@interface Drinks ()

@end

@implementation Drinks

- (void)initializeDrink:(NSString *)dName
               withCost:(float)dCost
          withAvailable:(BOOL)dAvailable {
    self.name = dName;
    self.cost = dCost;
    self.available = dAvailable;
}

@end
