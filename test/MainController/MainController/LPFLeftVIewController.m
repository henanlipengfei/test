//
//  LPFLeftVIewController.m
//  test
//
//  Created by 李鹏飞 on 2017/10/5.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFLeftVIewController.h"

@interface LPFLeftVIewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *leftView;

@end

@implementation LPFLeftVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *leftView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    leftView.dataSource = self;
    leftView.delegate = self;
    [self.view addSubview:leftView];
    self.leftView = leftView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"leftTableVIew";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor blueColor];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd项",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
@end
