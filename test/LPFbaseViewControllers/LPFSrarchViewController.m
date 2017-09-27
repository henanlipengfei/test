//
//  LPFSrarchViewController.m
//  test
//
//  Created by 李鹏飞 on 2017/9/27.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFSrarchViewController.h"
#import "LPFSearchController.h"
@interface LPFSrarchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>


@property (nonatomic,strong) LPFSearchController *searchController;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,strong) NSMutableArray *results;


@end

@implementation LPFSrarchViewController

#pragma mark - 懒加载
- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
- (NSMutableArray *)results
{
    if (!_results) {
        _results = [NSMutableArray array];
    }
    return _results;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubViews];
}

-(void)addSubViews
{
    UITableView *tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
    self.tableView = tabView;
    
    
    LPFSearchController *searchController = [[LPFSearchController alloc] initWithSearchResultsController:nil];
    
    searchController.delegate = self;
    searchController.searchBar.placeholder = @"搜索";
    //设置更新代理
    searchController.searchResultsUpdater = self;
    //搜索时展示透明视图
    searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController = searchController;
    self.tableView.tableHeaderView = searchController.searchBar;
    
}
#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 这里通过searchController的active属性来区分展示数据源是哪个
    if (self.searchController.active) {
        
        return self.results.count ;
    }
    
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    // 这里通过searchController的active属性来区分展示数据源是哪个
    if (self.searchController.active ) {
        
        cell.textLabel.text = [self.results objectAtIndex:indexPath.row];
    } else {
        
        cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.searchController.active) {
        NSLog(@"选择了搜索结果中的%@", [self.results objectAtIndex:indexPath.row]);
    } else {
        
        NSLog(@"选择了列表中的%@", [self.datas objectAtIndex:indexPath.row]);
    }
    
}

#pragma mark -  UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *inputStr = searchController.searchBar.text ;
    if (self.results.count > 0) {
        [self.results removeAllObjects];
    }
    for (NSString *str in self.datas) {
        
        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
            
            [self.results addObject:str];
        }
    }
    
    [self.tableView reloadData];
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
