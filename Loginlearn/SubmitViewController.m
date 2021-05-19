//
//  SubmitViewController.m
//  Loginlearn
//
//  Created by qiuqihong on 2021/5/11.
//  Copyright © 2021 qiuqihong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubmitViewController.h"

@interface SubmitViewController()

@property (nonatomic,strong) UILabel *submittedlabel;

@end

@implementation SubmitViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    _submittedlabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, self.view.frame.size.width-40, 50)];
    _submittedlabel.text = @"注册成功！";
    _submittedlabel.numberOfLines = 0;
    _submittedlabel.font = [UIFont systemFontOfSize:15];
    _submittedlabel.textColor = [UIColor whiteColor];
    _submittedlabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_submittedlabel];
}

@end
