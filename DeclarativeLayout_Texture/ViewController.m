//
//  ViewController.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/28.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "ViewController.h"
#import "YSW_TableViewCell.h"

#import "FlowViewController.h"
#import "StackSpecLayoutViewController.h"


#pragma mark - 常量参数
static NSString * CellID = @"TextureLayoutCell";
static CGFloat CellHeight = 60.f;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArr = @[
                     @[@"FlexBoxViews", @"声明式-弹性盒式布局"],
                     @[@"CollectionView", @"仿抖音同城-流式布局"]
                     ];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YSW_TableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
    [self.tableView reloadData];
}

#pragma mark - tableView delegate & dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSW_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    [cell updateWithTitle:self.dataArr[indexPath.row][0] desc:self.dataArr[indexPath.row][1]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[StackSpecLayoutViewController new] animated:YES];
            break;
            
            case 1:
            [self.navigationController pushViewController:[FlowViewController new] animated:YES];
            break;
            
        default:
            break;
    }
}

@end
