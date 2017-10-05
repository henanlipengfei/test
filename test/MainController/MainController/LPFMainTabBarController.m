//
//  LPFMainTabBarController.m
//  test
//
//  Created by 李鹏飞 on 2017/10/5.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFMainTabBarController.h"
#import "LPFMainNavigationController.h"
#import "ReleaseTableViewController.h"
#import "InterestedTableViewController.h"
#import "FriendTableViewController.h"
#import "FindTableViewController.h"
@interface LPFMainTabBarController ()

@end

@implementation LPFMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //添加发布模块
    ReleaseTableViewController *releaseVc = [[ReleaseTableViewController alloc] init];
    [self addChildViewController:releaseVc title:@"发布" imageName:@"ic_tab_publish" selectedImageName:@"ic_tab_publish_p"];
    //添加关注模块
    InterestedTableViewController *interestedVC = [[InterestedTableViewController alloc] init];
    [self addChildViewController:interestedVC title:@"关注" imageName:@"ic_tab_follow" selectedImageName:@"ic_tab_follow_p"];
    //添加朋友圈模块
    FriendTableViewController *friendVc = [[FriendTableViewController alloc] init];
    [self addChildViewController:friendVc title:@"哈友圈" imageName:@"ic_tab_friends" selectedImageName:@"ic_tab_friends_p"];
    //添加发现模块
     FindTableViewController *findVC = [[FindTableViewController alloc] init];
    [self addChildViewController:findVC title:@"发现" imageName:@"ic_tab_find" selectedImageName:@"ic_tab_find_p"];
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
