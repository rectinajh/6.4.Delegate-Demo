//
//  ViewController.m
//  6.4_UI_HW
//
//  Created by rimi on 15/6/4.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ViewController.h"
#import "LoginedViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UITextField       *usernameTextField;
@property (nonatomic, strong) UITextField       *passwordTextField;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUserInterface];
}

- (void)initUserInterface
{
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    UIImage *backgoundImage = [UIImage imageNamed:@"9.jpg"];
    UIImageView *backgoundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    backgoundImageView.image = backgoundImage;
    backgoundImageView.center = CGPointMake(width / 2 , height / 2);
    
    [self.view addSubview:backgoundImageView];
    
    
    /***************头像图片***************/
    UIImageView *imageViewAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 181, 181)];
    imageViewAvatar.center = CGPointMake(width / 2.0, 148);
    imageViewAvatar.image = [UIImage imageNamed:@"9"];
    [self.view addSubview:imageViewAvatar];
    
    
    /**************输入文本窗口 usernameTextField***************/
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(-5, 230, width + 10, 40)];
    
    //边框
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //placeholder
    self.usernameTextField.placeholder = @"用户名";
    
    //对齐方式
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    
    //禁用自动大小写
    self.usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //禁用自动纠正
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //清空文本框按钮
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //属性关联
    self.usernameTextField = usernameTextField;
    
    //添加到父视图
    [self.view addSubview:self.usernameTextField];
    
    //委托
    //self.usernameTextField.delegate = self;
    
    
    /**************输入文本窗口 passwordTextField**************/
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(-5, 269, width + 10, 40)];
    
    //边框
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //placeholder
    self.passwordTextField.placeholder = @"密码";
    
    //对齐方式
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    
    //禁用自动大小写
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //禁用自动纠正
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //清空文本框按钮
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //安全保护
    self.passwordTextField.secureTextEntry = YES;
    
    //属性关联
    self.passwordTextField = passwordTextField;
    
    //添加到父视图
    [self.view addSubview:self.passwordTextField];
    
    //委托
    self.passwordTextField.delegate = self;
    
    /************* 登陆按钮 *************/
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //位置
    loginButton.bounds = CGRectMake(0, 0, 100, 30);
    loginButton.center = CGPointMake(width / 2.0, 350);
    
    //背景颜色
    loginButton.backgroundColor = [UIColor colorWithRed:0.165f green:0.427f blue:0.620f alpha:1.00f];
    
    //圆角
    loginButton.layer.cornerRadius = 5;
    
    //标题
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:loginButton];
    
    //事件
    [loginButton addTarget:self action:@selector(handleLoginButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)handleLoginButtonEvent:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    /* (登陆后跳转到loginedViewController)
     LoginedViewController *loginedViewController = [[LoginedViewController alloc] init];
     
     //创建UILel(容器), 否则loginedViewController.usernameInformation是一个nil指针
     loginedViewController.usernameInformation = [[UILabel alloc] init];
     */
    
    //UIActivityIndicatorView
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [indicatorView setBounds:CGRectMake(0, 0, 30, 30)];
    [indicatorView setCenter:CGPointMake(CGRectGetWidth(self.view.bounds) / 2.0, 322)];
    
    indicatorView.hidesWhenStopped = YES;
    [indicatorView startAnimating];
    [self.view addSubview:indicatorView];
    
    NSString *myName     =  @"admin";
    NSString *myPassword =  @"123456";
    
    BOOL usernameMatch = [self.usernameTextField.text isEqualToString:myName];
    BOOL passwordMatch = [self.passwordTextField.text isEqualToString:myPassword];
    
    if (usernameMatch && passwordMatch) {
        
        //延迟跳转界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [indicatorView stopAnimating];
            
            //代理传值
            if (self.delegate && [self.delegate conformsToProtocol:@protocol(ViewControllerDelegate)]) {
                
                [self.delegate handleloginSucceed:_usernameTextField.text];
                
            }
            
            //跳转界面
            [self.navigationController popViewControllerAnimated:YES];
            
            
        });
        
    } else {
        
        if ([self.usernameTextField.text length] == 0 && [self.passwordTextField.text length] == 0) {
            
            [indicatorView stopAnimating];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示！" message:@"请输入用户名或密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alertView show];
            
        } else if ([self.usernameTextField.text length] == 0 && [self.passwordTextField.text length] != 0) {
            
            [indicatorView stopAnimating];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示！" message:@"输入用户名" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alertView show];
            
        } else if ([self.usernameTextField.text length] != 0 && [self.passwordTextField.text length] == 0) {
            
            [indicatorView stopAnimating];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示！" message:@"请输入密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alertView show];
            
        } else {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [indicatorView stopAnimating];
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"用户名或密码输入不正确！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
                
                [alertView show];
                
            });
            
        }
        
    }
    
}


//按键盘[return]后视图失去焦点
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

//点按空白[touch black place]，所有文本框失去焦点
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//限定文本位数(由delegate完成-->self)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.text.length + string.length > 15) {
        
        return NO;
    }
    
    return YES;
}

@end
