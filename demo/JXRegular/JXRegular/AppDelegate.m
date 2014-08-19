//
//  AppDelegate.m
//  JXRegular
//
//  Created by andy on 8/17/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import "AppDelegate.h"
#import "NSString+JXRegular.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 判断是否为中文
    BOOL isMatching = [@"匹配是否含有中文" isRegexMatching:@"[^x00-xff]*"];
    NSLog(@"匹配是否含有中文结果: %d", isMatching);
    
    // 查找匹配正则的子串
    NSString *subStr = [@"我的手机号码是010-88888888" regexMatching:@"\\d{3}-\\d{8}|\\d{4}-\\d{7}"];
    NSLog(@"%@", subStr);
    
    // 替换匹配正的的子串
    NSString *replaceStr = [@"HAHAHA,我有一个的好东西" regex:@"HA" replaceStr:@"哈"];
    NSLog(@"%@", replaceStr);
    
    
    // 匹配某种业务
    isMatching = [@"http://www.baidu.com" isRegexType:regexType_URL];
    NSLog(@"%d", isMatching);

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
