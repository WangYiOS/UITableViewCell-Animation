//
//  WYTableViewController.m
//  POP学习
//
//  Created by 王一 on 16/9/7.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import "WYTableViewController.h"
#import "WYTableViewCell.h"

@interface WYTableViewController ()

@end

static NSString *CellID = @"CellID";

@implementation WYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"POP学习--王一";
    [self.tableView registerClass:[WYTableViewCell class] forCellReuseIdentifier:CellID];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
