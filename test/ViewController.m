//
//  ViewController.m
//  test
//
//  Created by 李鹏飞 on 2017/5/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViews];
    
    
}
#pragma mark - 创建布局
-(void)addSubViews
{
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"欢迎进入";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:50];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    
}
@end
