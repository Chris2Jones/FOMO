//
//  Drinks.h
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drinks : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float cost;
@property (nonatomic) BOOL available;


- (void)initializeDrink:(NSString *)dName
               withCost:(float)dCost
          withAvailable:(BOOL)dAvailable;

@end
