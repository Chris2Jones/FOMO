//
//  User.h
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *loginCredentials;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *password;
@property (nonatomic) BOOL *lockFundStatus;
@property (nonatomic) float *tab;
@property (strong, nonatomic) NSString *transactionHistory;
@property (strong, nonatomic) NSArray *creditCards;

@end
