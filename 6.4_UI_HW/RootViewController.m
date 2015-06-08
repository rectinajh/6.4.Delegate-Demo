//
//  RootViewController.m
//  6.4_UI_HW
//
//  Created by rimi on 15/6/4.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@property (strong, nonatomic) UILabel       *usernameLabel;
@property (strong, nonatomic) UIButton      *loginButton;
@property (strong, nonatomic) UIButton      *signOutButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
    
}

- (void)initializeUserInterface
{
    //主页面配置（背景色，标题）
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    
    //背景图片
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    //UIImage *backgroundImage = [UIImage imageNamed:@"1"];
    UIImageView *backgroundimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    //backgroundimageview.image = backgroundImage;
    backgroundimageview.center = CGPointMake(width / 2, height / 2);
    
    //[self.view addSubview:backgroundimageview];
    
    //登录按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    loginButton.bounds = CGRectMake(0, 0, 100, 30);
    loginButton.titleLabel.numberOfLines = 0;
    loginButton.center = self.view.center;
    loginButton.backgroundColor = [UIColor grayColor];
    loginButton.layer.cornerRadius = 5;
    loginButton.layer.shadowRadius = 1;
    loginButton.titleLabel.font = [UIFont fontWithName:@"calibri" size:10];
    loginButton.tag = 1;
    [loginButton addTarget:self action:@selector(handleloginSucceed:) forControlEvents:UIControlEventTouchUpInside];
    _loginButton = loginButton;
    [self.view addSubview:_loginButton];
    
    //注销按钮
    UIButton *signOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [signOutButton setTitle:@"退出" forState:UIControlStateNormal];
    signOutButton.bounds = CGRectMake(0, 0, 100, 30);
    signOutButton.titleLabel.numberOfLines = 0;
    signOutButton.center = self.view.center;
    signOutButton.backgroundColor = [UIColor blueColor];
    signOutButton.layer.cornerRadius = 5;
    signOutButton.layer.shadowRadius = 1;
    signOutButton.titleLabel.font = [UIFont fontWithName:@"calibri" size:10];
    signOutButton.hidden = YES;
    signOutButton.tag = 2;
    [signOutButton addTarget:self action:@selector(handleLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    _signOutButton = signOutButton;
    [self.view addSubview:_signOutButton];


}

- (void)handleLoginButton:(UIButton *)sender
{
    //登录按钮点击
    if (sender.tag == 1) {
        
        ViewController *viewController = [[ViewController alloc]init];
        
        //第四步:遵守协议，成为代理
        
        viewController.delegate = self;
        
        //推送到登录界面
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        
        _usernameLabel.text = nil;      //文本隐藏
        
        _signOutButton.hidden = YES;  //隐藏注销按钮
        
        _loginButton.hidden = NO;   //显示登录按钮
    
    }
}

//第五步：实现协议规定的方法（把传来的值（usernameinfo）显示出来）

- (void)handleloginSucceed:(NSString *)usernameInfor
{
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    
    usernameLabel.center = CGPointMake(self.view.center.x, 200);
    usernameLabel.textAlignment = NSTextAlignmentCenter;
    usernameLabel.font = [UIFont systemFontOfSize:20];
    usernameLabel.textColor = [UIColor whiteColor];
    
    _usernameLabel = usernameLabel;
    _usernameLabel.text = usernameInfor;
    [self.view addSubview:_usernameLabel];

}

//生命周期：每次加载时调用
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_usernameLabel.text) {
        
        _loginButton.hidden = NO;
        
    } else {
    
        _signOutButton.hidden = NO;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
