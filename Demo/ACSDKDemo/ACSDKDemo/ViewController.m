//
//  ViewController.m
//  ACSDKDemo
//
//  Created by Hong on 2017/5/15.
//  Copyright © 2017年 wlnana17. All rights reserved.
//

#import "ViewController.h"
#import <ACSDK/ACSDKMain.h>
#import <ACSDK/ACPaySettings.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, ACProtocol>
{
    UITableView *_tableView;
    NSArray *datas;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [[ACSDKMain sharedInstance] initWithAppId:@"5" appKey:@"czJydGlEeTI5dTNScko0WlFHR05xZz09"];
    [ACSDKMain sharedInstance].delegate = self;
    
    datas = @[
              @"登陆",
              @"登出",
              @"显示悬浮窗",
              @"隐藏悬浮窗",
              @"是否登陆",
              @"显示用户中心",
              @"充值1元",
              @"充值10元",
              @"支付1元",
              @"支付10元",
              ];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            [[ACSDKMain sharedInstance] showLogin];
        }
            break;
        case 1:
        {
            [[ACSDKMain sharedInstance] logout];
        }
            break;
        case 2:
        {
            [[ACSDKMain sharedInstance] showOverlays];
        }
            break;
        case 3:
        {
            [[ACSDKMain sharedInstance] hideOverlays];
        }
            break;
        case 4:
        {
            NSLog(@"是否登陆 ： %u", [[ACSDKMain sharedInstance] isLogined]);
        }
            break;
        case 5:
        {
            [[ACSDKMain sharedInstance] showUserCenter];
        }
            break;
        case 6:
        {
            ACPaySettings *settings = [[ACPaySettings alloc] init];
            settings.amount = @1;
            settings.extra_param = @"充值1元";
            settings.server = @"区服";
            settings.serverId = @"区服id";
            settings.name = @"角色名";
            settings.nameId = @"角色id";
            [[ACSDKMain sharedInstance] recharge:settings];
        }
            break;
        case 7:
        {
            ACPaySettings *settings = [[ACPaySettings alloc] init];
            settings.amount = @10;
            settings.extra_param = @"充值10元";
            settings.server = @"区服";
            settings.serverId = @"区服id";
            settings.name = @"角色名";
            settings.nameId = @"角色id";
            [[ACSDKMain sharedInstance] recharge:settings];
        }
            break;
        case 8:
        {
            ACPaySettings *settings = [[ACPaySettings alloc] init];
            settings.amount = @1;
            settings.extra_param = @"支付1元";
            settings.server = @"区服";
            settings.serverId = @"区服id";
            settings.name = @"角色名";
            settings.nameId = @"角色id";
            [[ACSDKMain sharedInstance] pay:settings];
        }
            break;
        case 9:
        {
            ACPaySettings *settings = [[ACPaySettings alloc] init];
            settings.amount = @10;
            settings.extra_param = @"支付10元";
            settings.server = @"区服";
            settings.serverId = @"id";
            settings.name = @"角色名";
            settings.nameId = @"角色id";
            [[ACSDKMain sharedInstance] pay:settings];
        }
            break;
    }
}

#pragma mark - ACProtocol

- (void)acDidLogin:(NSString *)userId token:(NSString *)token
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"userId = %@, token = %@", userId, token);
}

- (void)acDidLoginFailed:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"error = %@", error);
}

- (void)acDidLogout
{
    NSLog(@"%s", __FUNCTION__);
}

@end
