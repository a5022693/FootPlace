//
//  MovieViewController.m
//  FootPlace
//
//  Created by mac on 15/11/3.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "MovieViewController.h"
#import "CameraViewController.h"
#import "ShuiYin.h"
@interface MovieViewController ()

@end

@implementation MovieViewController
{
    UITextView *cnText;
    
    UITextView *enText;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 18, 30);
    [leftBtn setImage:[UIImage imageNamed:@"userinside_backwhite"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 30);
    [rightBtn setTitle:@"更改" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [self createTableView];
}
-(void)changeAction
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"waterAction" object:nil userInfo:@{@"CNText":cnText.text,@"ENText":enText.text}];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)backAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeigth) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"textCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return _movieTextArray.count;
}
//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    
//    return 1;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//   if (!cell) {        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    }
//    else
//    {
//        while ([cell.contentView.subviews lastObject] != nil) {
//            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
//        }
//    }
   // if(indexPath.section ==0 && indexPath.row==0)
    if(indexPath.section ==0)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"textCell"];
        }
        else
        {
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        
        cnText = [[UITextView alloc]initWithFrame:CGRectMake(5, 5, KScreenWidth-10, 100)];
        cnText.font = [UIFont systemFontOfSize:16.0f];
        cnText.backgroundColor = [UIColor clearColor];
        cnText.editable = YES;
        
        cnText.backgroundColor = [UIColor lightGrayColor];
        cnText.layer.cornerRadius = 10;
        cnText.layer.borderWidth = 2;
        cnText.layer.borderColor = [UIColor blackColor].CGColor;
        [cell addSubview:cnText];
        
        enText = [[UITextView alloc]init];
        [cell addSubview:enText];
        return cell;
    }else{
        
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        }
        else
        {
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        UILabel *CNText = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, KScreenWidth-20, 30)];
        CNText.text = _movieTextArray[indexPath.row][@"subtitleCN"];
        CNText.font = [UIFont systemFontOfSize:12];
        CNText.textAlignment = NSTextAlignmentCenter;
        CNText.numberOfLines = 0;
        [cell addSubview:CNText];
        UILabel *ENText = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, KScreenWidth-20, 30)];
        ENText.text = _movieTextArray[indexPath.row][@"subtitleEN"];
        ENText.font = [UIFont systemFontOfSize:12];
        ENText.textAlignment = NSTextAlignmentCenter;
        ENText.numberOfLines = 0;
        [cell addSubview:ENText];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 95, 250, 20)];
        title.text = _movieTextArray[indexPath.row][@"sourceName"];
        title.font = [UIFont systemFontOfSize:14];
        [cell addSubview:title];
        
    return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    cnText.text = _movieTextArray[indexPath.row][@"subtitleCN"];
    
    enText.text = _movieTextArray[indexPath.row][@"subtitleEN"];
    [self changeAction];
    
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
