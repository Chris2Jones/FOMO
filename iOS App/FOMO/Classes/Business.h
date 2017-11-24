//
//  Business.h
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Business : NSObject

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *drinks;
@property (strong, nonatomic) NSString *address;
@property (nonatomic) float bankInfo;

@end
