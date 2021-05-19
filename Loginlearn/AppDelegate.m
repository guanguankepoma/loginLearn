//
//  AppDelegate.m
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/8.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self createAppWindow];
    return YES;
}

- (void)createAppWindow {
    //添加窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor brownColor];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString* name = [userDefault objectForKey:@"name"];
    
    if(name == nil)
    {
        //设置窗口的根控制器
        ViewController *vc = [[ViewController alloc] init];
        vc.view.backgroundColor =[UIColor brownColor];
        //创建导航控制器
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    }
    else
    {
        //设置窗口的根控制器
        LoginViewController *lvc = [[LoginViewController alloc] init];
        lvc.view.backgroundColor = [UIColor brownColor];
        //创建导航控制器
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lvc];
        self.window.rootViewController = nav;
        [self.window makeKeyAndVisible];
    }
}
#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
