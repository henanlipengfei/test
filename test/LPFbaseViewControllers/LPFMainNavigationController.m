//
//  LPFMainNavigationController.m
//  test
//
//  Created by 李鹏飞 on 2017/9/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFMainNavigationController.h"

@interface LPFMainNavigationController ()

@end

@implementation LPFMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.navigationItem.leftBarButtonItem == nil) {
        UIButton *leftbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        [leftbtn setTitle:@"设置" forState:UIControlStateNormal];
        [leftbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    //首先取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //注意这是设置导航栏背景的颜色，即导航栏所覆盖的底层的颜色。而不是导航栏本身的颜色。
    [navBar setBackgroundColor:[UIColor greenColor]];
    //这才是设置导航栏本身的颜色
    [navBar setBarTintColor:[UIColor orangeColor]];
    //如果要对导航栏设置背景图片
    [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    //设置阴影（IOS7 later）
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(2, 2);
    //设置标题
    NSDictionary *barTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIColor greenColor],NSForegroundColorAttributeName,
                                            [UIFont fontWithName:@"Verdana" size:17.0f],NSFontAttributeName,
                                            shadow, NSShadowAttributeName,
                                            nil];
    [navBar setTitleTextAttributes:barTitleTextAttributes];
    
    //设置首页默认的标题
    [[self.viewControllers lastObject] setTitle:@"Lotheve"];
}
//#pragma mark 重写push方法
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [super pushViewController:viewController animated:YES];
//    
//    //如果导航栏左按钮不存在，则对其进行设置
//    if (viewController.navigationItem.leftBarButtonItem == nil) {
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
//    }
//    //设置默认的导航栏标题
//    viewController.title = @"Test";
//}
#pragma mark 设置按钮动作
- (void)backAction:(UIBarButtonItem *)sender
{
    [self popViewControllerAnimated:YES];
}

#pragma mark 设置状态栏类型
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark 设置横竖屏切换
//开关（是否允许切换）
- (BOOL)shouldAutorotate
{
    return YES;
}

//支持的方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
@end
