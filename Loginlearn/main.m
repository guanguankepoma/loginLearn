////
////  main.m
////  Loginlearn
////
////  Created by qiuqihong on 2021/5/8.
////  Copyright © 2021 qiuqihong. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
