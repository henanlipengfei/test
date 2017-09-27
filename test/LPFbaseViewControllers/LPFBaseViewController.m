//
//  LPFBaseViewController.m
//  test
//
//  Created by 李鹏飞 on 2017/9/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFBaseViewController.h"

@interface LPFBaseViewController ()

@end

@implementation LPFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *leftBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    [leftBtn setImage:[UIImage imageNamed:@"Stock_Red_arrow"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma 返回按钮监听
-(void)leftButtonClick:(UIButton *)btn
{

    if (self.navigationController.childViewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];

    }else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
