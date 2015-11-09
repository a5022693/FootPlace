//
//  MassageViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "MassageViewController.h"
#import "AppDelegate.h"
#import "MessageTableViewCell.h"
#import "CommentViewController.h"
#import "NotificationViewController.h"
#import "GoodViewController.h"
#import "RequestUrlConnection.h"
#import "MessageModel.h"
#import "CommentCell.h"
#import "GoodCell.h"
#import "ZanModel.h"
#import "NOtificationCell.h"
#import "NotificationModel.h"
static NSString *moreCellId = @"moreCellId";
@interface MassageViewController ()

@end

@implementation MassageViewController

{
    UITableView *_tabView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubViews];
   
        
}
-(void)_createSubViews
{
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth) style:UITableViewStyleGrouped];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    _tabView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tabView];
    
    [_tabView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:moreCellId];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(76/255.0) green:(75/255.0) blue:(74/255.0) alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}
     ];

// self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 3;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return @"最近消息";
        
    }
    return @"最近联系人";
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId forIndexPath:indexPath];
    if(indexPath.section == 0)
    {
    if(indexPath.row ==0)
    {
        cell.commentImage.image = [UIImage imageNamed:@"msg_comment"];
        cell.commentLabel.text = @"评论";
    }
    else if(indexPath.row ==1)
    {
        cell.commentImage.image = [UIImage imageNamed:@"msg_like"];
        cell.commentLabel.text = @"赞的";
    }
    else if(indexPath.row ==2)
    {
        cell.commentImage.image = [UIImage imageNamed:@"msg_notice"];
        cell.commentLabel.text = @"通知";
    }
    }
    else{
        cell.commentImage.image = [UIImage imageNamed:@"message_fotoplace@2x"];
        cell.commentImage.frame = CGRectMake(16, 15, 30, 30);
        cell.commentImage.layer.cornerRadius =15;
        cell.commentLabel.text = @"足记君";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentViewController *comment =[[CommentViewController alloc]init];
    GoodViewController *zan = [[GoodViewController alloc]init];
    NotificationViewController *notification = [[NotificationViewController alloc]init];
//
    
    if(indexPath.section ==0&&indexPath.row ==0)
    {
        NSString *url = @"http://www.fotoplace.cc/api2/user/user_get_new_comment_list.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&offset=0";
        [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
            
            NSDictionary *dic1 = result;
            
          //  CommentCell *cell = [[CommentCell alloc]init];
            NSDictionary *dic2 = dic1[@"data"];
            NSArray *array = dic2[@"messages"];
            
            
            comment.celldata = array;

        [self.navigationController pushViewController:comment animated:YES];
        }];
    }
    else if(indexPath.section ==0&&indexPath.row ==1)
    {
        NSString *url = @"http://www.fotoplace.cc/api2/user/user_get_like_list.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&offset=0";
        [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
            
            NSDictionary *dic1 = result;
            
         //   GoodCell *cell = [[GoodCell alloc]init];
            NSDictionary *dic2 = dic1[@"data"];
            NSArray *array = dic2[@"messages"];
            
            
            zan.celldata = array;
        [self.navigationController pushViewController:zan animated:YES];
        }];
    }
    else if(indexPath.section ==0&&indexPath.row ==2)
    {
        NSString *url = @"http://www.fotoplace.cc/api2/user/user_get_notice_list.php?version=2.9&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5&pageindex=0";
        [RequestUrlConnection requestWithUrlString:url Parameters:nil Method:@"POST" FinishBlock:^(id result) {
            
            NSDictionary *dic1 = result;
            
        //    NOtificationCell *cell = [[NOtificationCell alloc]init];
            NSDictionary *dic2 = dic1[@"data"];
            NSArray *array = dic2[@"messages"];
            
            
            notification.celldata = array;

        [self.navigationController pushViewController:notification animated:YES];
        }];
    }
   
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
