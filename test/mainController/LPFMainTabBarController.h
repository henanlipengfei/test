//
//  LPFMainTabBarController.h
//  test
//
//  Created by 李鹏飞 on 2017/5/18.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPFMainTabBarController : UITabBarController
/**
 *  添加一个子控制器
 *  @param childVc           子控制器
 *  @param title             标题
 *  @param imageName         默认状态图片名称
 *  @param selectedImageName 选中状态图 片的名称
 */
- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end
