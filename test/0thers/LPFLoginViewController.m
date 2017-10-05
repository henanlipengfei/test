//
//  LPFLoginViewController.m
//  test
//
//  Created by 李鹏飞 on 2017/10/5.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFLoginViewController.h"
#import "LPFMainTabBarController.h"
#import "AppDelegate.h"
#import "LPFLeftVIewController.h"
#define APPDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define KeyWindow [UIApplication sharedApplication].keyWindow

//获取屏幕宽高
#define Screen_height  [[UIScreen mainScreen] bounds].size.height
#define Screen_width   [[UIScreen mainScreen] bounds].size.width
@interface LPFLoginViewController ()
@property (nonatomic,weak) UITextField *accountField;
@property (nonatomic,weak) UITextField *passwordField;
@end

@implementation LPFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self addSubViews];
    // Do any additional setup after loading the view.
}

-(void)addSubViews
{
    UITextField *accountField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, Screen_width - 200, 44)];
    accountField.backgroundColor = [UIColor cyanColor];
    accountField.placeholder = @"请输入账号";
    accountField.font = [UIFont systemFontOfSize:12];
    accountField.textColor = [UIColor redColor];
    [self.view addSubview:accountField];
    self.accountField = accountField;
    
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(100,  CGRectGetMaxY(self.accountField.frame)+20, Screen_width - 200, 44)];
    passwordField.backgroundColor = [UIColor cyanColor];
    passwordField.placeholder = @"请输入密码";
    passwordField.font = [UIFont systemFontOfSize:12];
    passwordField.textColor = [UIColor redColor];
    [self.view addSubview:passwordField];
    self.passwordField = passwordField;
    
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, CGRectGetMaxY(self.passwordField.frame)+100, Screen_width - 240, 50)];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.backgroundColor = [UIColor cyanColor];
    [nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [nextBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
}
#pragma mark - 登录成功
-(void)login
{
    //显示首页界面
    LPFMainTabBarController *mainTBC = [[LPFMainTabBarController alloc] init];
    APPDelegate.mainVc = mainTBC;
    LPFLeftVIewController *leftVc = [[LPFLeftVIewController alloc] init];
    APPDelegate.leftSlideVc = [[LeftSlideViewController alloc] initWithLeftView:leftVc andMainView:APPDelegate.mainVc];
    KeyWindow.rootViewController = APPDelegate.leftSlideVc;
}

@end
