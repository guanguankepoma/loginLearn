//
//  RegisterViewController.m
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/11.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterViewController.h"
#import "SubmitViewController.h"

@interface RegisterViewController()

@property (nonatomic,strong) UITextField *registeruser;
@property (nonatomic,strong) UITextField *firstpassword;
@property (nonatomic,strong) UITextField *secondpassword;
@property (nonatomic,strong) UIButton *submitButton;

@end

@implementation RegisterViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor brownColor]];
    
    //输入用户名
    _registeruser = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 50)];
    _registeruser.backgroundColor = [UIColor whiteColor];
    _registeruser.placeholder = [NSString stringWithFormat:@"请输入用户名："];
    //优化为圆角
    _registeruser.layer.cornerRadius = 5.0;
    //首字母是否大写
    _registeruser.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:_registeruser];
    
    //输入密码
    _firstpassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 50)];
    _firstpassword.backgroundColor = [UIColor whiteColor];
    _firstpassword.placeholder = [NSString stringWithFormat:@"请输入密码："];
    //优化为圆角
    _firstpassword.layer.cornerRadius = 5.0;
    //密码密文处理
    [_firstpassword setSecureTextEntry:YES];
    [self.view addSubview:_firstpassword];
    
    //再次输入密码
    _secondpassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    _secondpassword.backgroundColor = [UIColor whiteColor];
    _secondpassword.placeholder = [NSString stringWithFormat:@"请再次输入密码："];
    //优化为圆角
    _secondpassword.layer.cornerRadius = 5.0;
    //密码密文处理
    [_secondpassword setSecureTextEntry:YES];
    [self.view addSubview:_secondpassword];
    
    //提交按钮
    _submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_submitButton setFrame:CGRectMake(20, 420, self.view.frame.size.width-40, 50)];
    
    [_submitButton setTitle:@"submit" forState:UIControlStateNormal];
    [_submitButton setBackgroundColor:[UIColor blackColor]];
    [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //添加点击事件
    [_submitButton addTarget:self action:@selector(onClicksubmit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitButton];
    
}

//注册成功后将用户信息写入本地文件
- (void)writeName:(NSString *)usrName passWord:(NSString *)passWord {
    //获取文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //拼接要写入文件的路径
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"test.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *str = [NSString stringWithFormat:@"\n%@ %@",usrName,passWord];
    //如果不存在
    if(![fileManager fileExistsAtPath:appFile]) {
        
        [str writeToFile:appFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForUpdatingAtPath:appFile];
    //将节点跳到文件尾
    [writeFileHandle seekToEndOfFile];
    NSData* stringData = [str dataUsingEncoding:NSUTF8StringEncoding];
    [writeFileHandle writeData:stringData];
    
    return;
}


//判断用户名是否已存在
- (BOOL) nameisexist:(NSString* ) usrname {
    //获取文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //拼接要读取文件的路径
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"test.txt"];
    NSString *conTent = [NSString stringWithContentsOfFile:appFile encoding:NSUTF8StringEncoding error:nil];
    NSArray* dataarr = [conTent componentsSeparatedByString:@"\n"];
    for(int i =0;i<dataarr.count;) {
        //获取一行数据中的第一列
        NSArray *temp = [dataarr[i] componentsSeparatedByString:@" "];
        NSString *text1 = temp[0];
        if([text1 isEqualToString:usrname])
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

//判断两次输入的密码是否相等
- (BOOL) firpwd:(NSString*)fpwd secpwd:(NSString*)spwd {
    
    if((fpwd != nil&&spwd != nil)&&[fpwd isEqualToString:spwd]) {
        return YES;
    }
    else
    {
        return NO;
    }
}

//注册提交按钮点击事件
- (IBAction)onClicksubmit:(id)sender {
    
    //跳转到注册成功的界面
    NSString *username = _registeruser.text;
    NSString *firstpwd = _firstpassword.text;
    NSString *secondpwd = _secondpassword.text;
    if([self firpwd:firstpwd secpwd:secondpwd]&&![self nameisexist:username]) {
        SubmitViewController *svc = [[SubmitViewController alloc] init];
        [self.navigationController pushViewController:svc animated:YES];
        //将注册信息写入文件
        [self writeName:username passWord:firstpwd];
    }
    else
    {
        if(![self firpwd:firstpwd secpwd:secondpwd])
        {
            NSLog(@"请输入相同的密码！");
        }
        else
        {
            NSLog(@"用户名已存在！");
        }
    }
}

@end


