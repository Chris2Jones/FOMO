//
//  User.h
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Business.h"

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *password;
@property (nonatomic) BOOL *lockFundStatus;
@property (nonatomic) float tab;
@property (strong, nonatomic) NSString *transactionHistory;
@property (strong, nonatomic) NSArray *creditCards;


- (void) addInfo:(NSString *)name
    withPassword:(NSString *)userPassword
     withAddress:(NSString *)userAddress
    withUsername:(NSString *)userName
         withAge:(NSString *)age;
- (void) addToTab:(float)userTab;
- (bool)addTransactionPayerC:(User*)payee withAmount:(float)amount;
- (bool) addTransactionPayerB:(Business* )payee withAmout:(float)amount;
@end
