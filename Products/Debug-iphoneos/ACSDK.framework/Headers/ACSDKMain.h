//
//  ACSDKMain.h
//  AccounterDemo
//
//  Created by Hong on 2017/4/7.
//  Copyright © 2017年 Hong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ACPaySettings;

@protocol ACProtocol <NSObject>

/**
 登陆成功后的回调函数

 @param userId 用户唯一标识
 @param token 本次登陆的token信息。每次登陆都会的到不同的token。
 */
- (void)acDidLogin:(NSString *)userId token:(NSString *)token;

/**
 登录失败后的回调函数

 @param error 失败原因
 */
- (void)acDidLoginFailed:(NSError *)error;

/**
 登出后的回调函数
 */
- (void)acDidLogout;

@end

@interface ACSDKMain : NSObject

@property (nonatomic, weak) id<ACProtocol> delegate;

+ (instancetype)sharedInstance;

/**
 初始化SDK
 */
- (void)initWithAppId:(NSString *)appId appKey:(NSString *)appKey;

/**
 登陆
 */
- (void)showLogin;

/**
 登出
 */
- (void)logout;

/**
 显示悬浮窗
 */
- (void)showOverlays;

/**
 隐藏悬浮窗
 */
- (void)hideOverlays;

/**
 是否已经登陆
 */
- (BOOL)isLogined;

/**
 显示用户中心
 */
- (void)showUserCenter;

/**
 充值
 */
- (void)recharge:(ACPaySettings *)paySettings;

/**
 支付
 */
- (void)pay:(ACPaySettings *)paySettings;

@end
