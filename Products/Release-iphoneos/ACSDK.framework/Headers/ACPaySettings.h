//
//  ACPaySettings.h
//  AccounterDemo
//
//  Created by Hong on 2017/5/9.
//  Copyright © 2017年 Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACPaySettings : NSObject

@property (nonatomic, strong) NSNumber *amount;

@property (nonatomic, copy) NSString *extra_param;

/**
 游戏区服名称
 */
@property (nonatomic, copy) NSString *server;

/**
 游戏区服ID
 */
@property (nonatomic, copy) NSString *serverId;

/**
 游戏里面的角色名称
 */
@property (nonatomic, copy) NSString *name;

/**
 游戏角色ID
 */
@property (nonatomic, copy) NSString *nameId;

@end
