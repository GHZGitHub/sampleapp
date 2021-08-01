//
//  ViewController.m
//  sampleapp
//
//  Created by 高浩哲 on 2021/7/26.
//

#import "GHZNewsController.h"
#import "GHZNewsCell.h"
#import "NewsDetailViewController.h"
#import "GHZListLoader.h"
#import "ListCellModel.h"
@interface GHZNewsController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong,readwrite)GHZListLoader *loader;
@property(nonatomic,strong,readwrite)NSArray *dataArray;
@property(nonatomic,strong,readwrite)UITableView *listTableView;
@end

@implementation GHZNewsController
#pragma mark -vc lefe cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:tableview];
    self.listTableView = tableview;
    tableview.dataSource = self;
    tableview.delegate = self;
    
    
    self.loader = [GHZListLoader new];
    
    __weak typeof (self)wself = self;
    [self.loader loadDataWithFinishBlock:^(BOOL isSuccess, NSArray<ListCellModel *> * _Nullable dataarry) {
        __weak typeof (self)strongSelf = wself;
        strongSelf.dataArray = dataarry;
        [strongSelf.listTableView reloadData];
    }];
}
#pragma mark -tableviewdelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCellModel *model = self.dataArray[indexPath.row];
    NewsDetailViewController *vc = [[NewsDetailViewController alloc]initWithUrlString:model.url];
  
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -tableviewdatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GHZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!cell) {
        cell = [[GHZNewsCell alloc]init];
    }
    [cell layoutCellWithModel:self.dataArray[indexPath.row]];
    return  cell;
}

@end
