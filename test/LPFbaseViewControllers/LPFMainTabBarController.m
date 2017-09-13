//
//  LPFMainTabBarController.m
//  test
//
//  Created by 李鹏飞 on 2017/9/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFMainTabBarController.h"
#import "LPFMainNavigationController.h"
#import "MianViewController1.h"
#import "MainViewController2.h"
#import "MainViewController3.h"
#import "MianViewController4.h"
#import "MainViewController5.h"

@interface LPFMainTabBarController ()

@end

@implementation LPFMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //创建子控制器
    [self addChildViewController:[[MianViewController1 alloc] init] title:@"主页" imageName: nil selectedImageName:nil];
    [self addChildViewController:[[MainViewController2 alloc] init] title:@"第一页" imageName: nil selectedImageName:nil];
    [self addChildViewController:[[MainViewController3 alloc] init] title:@"第二页" imageName: nil selectedImageName:nil];
    [self addChildViewController:[[MianViewController4 alloc] init] title:@"第三页" imageName: nil selectedImageName:nil];
    [self addChildViewController:[[MainViewController5 alloc] init] title:@"第四页" imageName: nil selectedImageName:nil];
    
    
}

/**
 *  添加一个子控制器
 *  @param childVc           子控制器
 *  @param title             标题
 *  @param imageName         默认状态图片名称
 *  @param selectedImageName 选中状态图 片的名称
 */
- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //同时设置tabBarItem和导航控制器的标题
    //    childVc.title = title;
    
    // 设置标题
    childVc.title = title;
    // 设置图片
    [childVc.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [childVc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    //    //设置普通状态下tabBarItem的字体属性
    //    NSMutableDictionary *nolmalDict = [NSMutableDictionary dictionary];
    //    nolmalDict[NSForegroundColorAttributeName] = WLColor(170, 170, 170);
    //    nolmalDict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    //    [childVc.tabBarItem setTitleTextAttributes:nolmalDict forState:UIControlStateNormal];
    //
    //    // 设置选择状态下tabBarItem的字体属性
    //    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    //    selectedDict[NSForegroundColorAttributeName] = WLColorHex(@"#01708c");
    //    [childVc.tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
    //
    //
    //    //设置tabBarItem普通状态下的图片
    //    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    //    //
    //    //    //设置tabBarItem选中状态下的图片
    //    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    //    //设置在iOS7下选中的图片不被渲染
    //    if (iOS7) {
    //        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    }
    //    childVc.tabBarItem.selectedImage = selectedImage;
    //给子控制器包装一个导航控制器
    LPFMainNavigationController *nvc = [[LPFMainNavigationController alloc] initWithRootViewController:childVc];
    
    //将导航控制器添加到WLTabBarController中
    [self addChildViewController:nvc];
    
}

@end
