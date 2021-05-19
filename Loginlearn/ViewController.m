//
//  ViewController.m
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/8.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic,strong) UITextField *user;
@property (nonatomic,strong) UITextField *password;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //用户名
    _user = [[UITextField alloc] init];
    _user.backgroundColor = [UIColor whiteColor];
    _user.placeholder = [NSString stringWithFormat:@"用户名："];
    //优化为圆角
    _user.layer.cornerRadius = 5.0;
    //首字母是否大写
    _user.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:_user];
    
    //密码
    _password = [[UITextField alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 50)];
    _password.backgroundColor = [UIColor whiteColor];
    _password.placeholder = [NSString stringWithFormat:@"密码："];
    _password.layer.cornerRadius = 5.0;
    //密码密文处理
    [_password setSecureTextEntry:YES];
    [self.view addSubview:_password];
    
    //登录按钮
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor blackColor]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //添加点击事件
    [_loginButton addTarget:self action:@selector(onClickLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    //注册按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    [_registerButton setBackgroundColor:[UIColor blackColor]];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //添加点击事件
    [_registerButton addTarget:self action:@selector(onClickRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];

    //添加约束
    [self.user mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(130);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.password.mas_top).offset(-10);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.user.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.password.mas_bottom).offset(220);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.registerButton.mas_top).offset(-10);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
}

//验证用户名和密码是否正确
- (BOOL)verificationuser:(NSString*)username pwd:(NSString*)password {
    
    //获取文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //拼接要读取文件的路径
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"test.txt"];
    NSString *conTent = [NSString stringWithContentsOfFile:appFile encoding:NSUTF8StringEncoding error:nil];
    NSArray* dataarr = [conTent componentsSeparatedByString:@"\n"];
    
    for(int i =0;i<dataarr.count;) {
        //获取一行数据
        NSArray *temp = [dataarr[i] componentsSeparatedByString:@" "];
        NSString *text1 = temp[0];
        NSString *text2 = temp[1];
        if([text1 isEqualToString:username]&&[text2 isEqualToString:password])
        {
            return YES;
        }
        else
        {
            i++;
        }
    }
        return NO;
    }

//登录按钮点击事件
- (IBAction)onClickLogin:(id)sender {
    //获取用户输入的信息
    NSString *usertext = self.user.text;
    NSString *pwdtext = self.password.text;
    
    if([self verificationuser:usertext pwd:pwdtext])
    {
        //获取userDefault单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //登录成功后把用户名和密码存储在UserDefault
        [userDefaults setObject:usertext forKey:@"name"];
        [userDefaults setObject:pwdtext forKey:@"password"];
        [userDefaults synchronize];
        
        //跳转到登录成功界面
        LoginViewController *lvc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:lvc animated:YES];
    }
    else
    {
        NSLog(@"用户名或密码错误!");
    }
}

- (IBAction)onClickRegister:(id)sender {
    
    //跳转到注册界面
    RegisterViewController *rvc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:rvc animated:YES];
}
@end
