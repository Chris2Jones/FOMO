//
//  Transaction.h
//  FOMO
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property (strong, nonatomic) NSString *payer;
@property (strong, nonatomic) NSString *payee;
@property (nonatomic) NSInteger *amount;

@end
