//
//  NotificationViewController.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "NotificationViewController.h"
#import "NOtificationCell.h"
#import "WXLabel.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController
{
    UITableView *_tableView;
    
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)setCelldata:(NSArray *)celldata
{
    if(_celldata != celldata)
    {
        _celldata =celldata;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth / 2, 32, 30, 20)];
    [commentLabel setText:@"通知"];
    [commentLabel setTextColor:[UIColor whiteColor]];
    commentLabel.font = [UIFont systemFontOfSize:19];
    commentLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = commentLabel;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 18, 30);
    [leftBtn setImage:[UIImage imageNamed:@"userinside_backwhite"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth) style:UITableViewStylePlain];
    
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    [_tableView registerClass:[NOtificationCell class] forCellReuseIdentifier:@"NOtificationCell"];
    
    [self.view addSubview:_tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _celldata.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NOtificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NOtificationCell"];
//    if (cell != nil) {
//        NOtificationCell *cell = [[NOtificationCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"NOtificationCell"];
//    }
    cell.cellData = _celldata[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 100;
    
}


@end
