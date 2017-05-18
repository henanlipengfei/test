//
//  LPFMainTabBarController.m
//  test
//
//  Created by 李鹏飞 on 2017/5/18.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFMainTabBarController.h"
#import "LPFReleaseViewController.h"
#import "LPFAttentionViewController.h"
#import "LPFFriendsViewController.h"
#import "LPFFindsViewController.h"
#import "LPFMainNavigationController.h"
@interface LPFMainTabBarController ()


@end

@implementation LPFMainTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化子控制器
    [self addChildViewControllers];
}

#pragma mark - 初始化子控制器
-(void) addChildViewControllers
{
    //发布
    LPFReleaseViewController *relraseVc = [[LPFReleaseViewController alloc] init];
    [self addChildViewController:relraseVc title:@"发布" imageName:@"ic_tab_publish" selectedImageName:@"ic_tab_publish_p"];
    //关注
    LPFAttentionViewController *attentionVc = [[LPFAttentionViewController alloc] init];
     [self addChildViewController:attentionVc title:@"关注" imageName:@"ic_tab_follow" selectedImageName:@"ic_tab_follow_p"];

    //商友
    LPFFriendsViewController *friendsVc = [[LPFFriendsViewController alloc] init];
    [self addChildViewController:friendsVc title:@"哈友圈" imageName:@"ic_tab_friends" selectedImageName:@"ic_tab_friends_p"];

    //发现
    LPFFindsViewController *findsVc = [[LPFFindsViewController alloc] init];
    [self addChildViewController:findsVc title:@"发现" imageName:@"ic_tab_find" selectedImageName:@"ic_tab_find_p"];


    
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
    // 设置标题
    childVc.title = title;
    // 设置图片
    [childVc.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [childVc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
 
    //给子控制器包装一个导航控制器
    LPFMainNavigationController *nvc = [[LPFMainNavigationController alloc] initWithRootViewController:childVc];
    //将导航控制器添加到WLTabBarController中
    [self addChildViewController:nvc];
}
@end
