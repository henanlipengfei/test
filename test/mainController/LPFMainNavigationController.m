//
//  LPFMainNavigationController.m
//  test
//
//  Created by 李鹏飞 on 2017/5/18.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFMainNavigationController.h"

@interface LPFMainNavigationController ()

@end

@implementation LPFMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:LPFColor(0, 153, 187)];//WLColor(0, 153, 187)
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self setNavigationBar];
    

    

    
}
-(void)onClickedOKbtn
{
    
}
//设置导航栏文字的属性
- (void)setNavigationBar
{
    //设置主题颜色
    [self.navigationBar py_addToThemeColorPool:@"barTintColor"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [self.navigationBar setTitleTextAttributes:dict];
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}
@end
