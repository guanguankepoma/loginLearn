//
//  RegisterViewController.h
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/11.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

- (BOOL)firpwd:(NSString*)fpwd secpwd:(NSString*)spwd;
- (BOOL)nameisexist:(NSString* ) usrname;
- (void)writeName:(NSString *)usrName passWord:(NSString *)passWord;
@end

