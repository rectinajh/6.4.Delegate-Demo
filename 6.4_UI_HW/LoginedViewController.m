//
//  LoginedViewController.m
//  6.4_UI_HW
//
//  Created by rimi on 15/6/4.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "LoginedViewController.h"

@interface LoginedViewController ()

@end

@implementation LoginedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUserInterface];
}


- (void)initUserInterface {

    //背景
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    
    //用户信息
    UILabel *username = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    username.center = CGPointMake(width / 2, 200);
    
    NSString *usernameString = @"用户";
    username.text = [usernameString stringByAppendingString:self.usernameInfomating.text];
    username.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:username];
    
    //登出按钮
    UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    logoutButton.center = CGPointMake(width / 2, 300);
    logoutButton.backgroundColor = [UIColor whiteColor];
    
    [logoutButton setTitle:@"取消" forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [self.view addSubview:logoutButton];
    
    [logoutButton addTarget:self action:@selector(handleLogOutButtonEvent:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)handleLogOutButtonEvent:(UIButton *)logoutButton
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
