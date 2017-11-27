//
//  User.m
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "User.h"

@interface User ()

@end

@implementation User

- (void) addInfo:(NSString *)name
    withPassword:(NSString *)userPassword
     withAddress:(NSString *)userAddress
    withUsername:(NSString *)userName
         withAge:(NSString *)age {
    self.name = name;
    self.password = userPassword;
    self.address = userAddress;
    self.username = userName;
    self.age = age;
}

- (void) addToTab:(float)userTab {
    self.tab = self.tab + userTab;
}

- (bool)addTransactionPayerC:(User*)payee withAmount:(float)amount{
    if(self.tab > amount){
        self.tab = self.tab - amount;
        [payee addToTab:amount];
        return true;
    }
    return false;
}

- (bool) addTransactionPayerB:(Business* )payee withAmout:(float)amount{
    if(self.tab > amount){
        self.tab = self.tab - amount;
        [payee addToTab:amount];
        return true;
    }
    return false;
}

@end
