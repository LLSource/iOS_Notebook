//
//  BBSKeychainUtils
//  SuperPet
//
//  Created by JackZ on 16/3/18.
//  Copyright © 2016年 Supet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLKeychainUtils : NSObject

+ (NSString *) getPasswordForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

+ (BOOL) storeUsername: (NSString *) username andPassword: (NSString *) password forServiceName: (NSString *) serviceName updateExisting: (BOOL) updateExisting error: (NSError **) error;

+ (BOOL) deleteItemForUsername: (NSString *) username andServiceName: (NSString *) serviceName error: (NSError **) error;

@end
