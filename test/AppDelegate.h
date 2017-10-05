//
//  AppDelegate.h
//  test
//
//  Created by 李鹏飞 on 2017/5/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "LPFMainNavigationController.h"
#import "LPFMainTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//侧滑控制器
@property (nonatomic,strong) LeftSlideViewController *leftSlideVc;
//主控制器
@property (nonatomic,strong) LPFMainTabBarController *mainVc;


@end

