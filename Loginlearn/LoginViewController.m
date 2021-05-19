//
//  LoginViewController.m
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/10.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController()

@property (nonatomic,strong) UILabel *loginlabel;
@property (nonatomic,strong) UIButton *loginOutButton;


@end

@implementation LoginViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    _loginlabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300,
    self.view.frame.size.width-40, 50)];
    _loginlabel.text = @"登录成功！";
    _loginlabel.numberOfLines = 0;
    _loginlabel.font = [UIFont systemFontOfSize:15];
    _loginlabel.textColor = [UIColor whiteColor];
    _loginlabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_loginlabel];
    
    _loginOutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginOutButton setFrame:CGRectMake(20, 340, self.view.frame.size.width-40, 50)];
    [_loginOutButton setTitle:@"注 销" forState:UIControlStateNormal];
    [_loginOutButton setBackgroundColor:[UIColor blackColor]];
    [_loginOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //添加点击事件
    [_loginOutButton addTarget:self action:@selector(onClickLoginOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginOutButton];
}

- (IBAction)onClickLoginOut:(id)sender {
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
    
    //跳转到登录界面
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end


