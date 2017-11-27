//
//  PersistManager.m
//  FOMO
//
//  Created by admin on 11/20/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "PersistManager.h"

@implementation PersistManager

- (User *)returnUserForKey:(NSString *)key {
    User *user = [[User alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    user.username = [defaults objectForKey:[key stringByAppendingString:@"username"]];
    user.name = [defaults objectForKey:[key stringByAppendingString:@"name"]];
    user.email = [defaults objectForKey:[key stringByAppendingString:@"email"]];
    user.address = [defaults objectForKey:[key stringByAppendingString:@"address"]];
    user.age = [defaults objectForKey:[key stringByAppendingString:@"age"]];
    user.password = [defaults objectForKey:[key stringByAppendingString:@"password"]];
    user.tab = [defaults floatForKey:[key stringByAppendingString:@"tab"]];
    return user;
}

- (void)saveUser:(User *)userToSave ForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userToSave.username forKey:[key stringByAppendingString:@"username"]];
    [defaults setObject:userToSave.name forKey:[key stringByAppendingString:@"name"]];
    [defaults setObject:userToSave.email forKey:[key stringByAppendingString:@"email"]];
    [defaults setObject:userToSave.address forKey:[key stringByAppendingString:@"address"]];
    [defaults setObject:userToSave.age forKey:[key stringByAppendingString:@"age"]];
    [defaults setObject:userToSave.password forKey:[key stringByAppendingString:@"password"]];
    [defaults setFloat:userToSave.tab forKey:[key stringByAppendingString:@"tab"]];
    [defaults synchronize];
}

@end
