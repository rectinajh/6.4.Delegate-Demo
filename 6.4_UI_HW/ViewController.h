//
//  ViewController.h
//  6.4_UI_HW
//
//  Created by rimi on 15/6/4.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>


//第一步：创建协议
@protocol ViewControllerDelegate <NSObject>

- (void)handleloginSucceed:(NSString *)usernameInfo;

@end


@interface ViewController : UIViewController
//设置代理人属性
@property (nonatomic,weak)id <ViewControllerDelegate> delegate;

@end

