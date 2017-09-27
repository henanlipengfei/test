//
//  MianViewController1.m
//  test
//
//  Created by 李鹏飞 on 2017/9/13.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "MianViewController1.h"
#import "LPFSrarchViewController.h"
@interface MianViewController1 ()

@end

@implementation MianViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    searchBtn.backgroundColor = [UIColor cyanColor];
    [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    self.hidesBottomBarWhenPushed = NO;
//    
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.hidesBottomBarWhenPushed = YES;
//}
-(void)searchBtnClick:(UIButton *)btn
{
    LPFSrarchViewController *searchVc = [[LPFSrarchViewController alloc] init];
    
    searchVc.title = @"搜索";
    searchVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVc animated:YES];
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
