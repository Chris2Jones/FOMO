//
//  PersistManager.h
//  FOMO
//
//  Created by admin on 11/20/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface PersistManager : NSObject

- (User *)returnUserForKey:(NSString *)key;
- (void)saveUser:(User *)userToSave ForKey:(NSString *)key;

@end
