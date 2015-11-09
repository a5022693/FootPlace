//
//  UserTabbleView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/16.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "UserTabbleView.h"
#import "UserCell.h"
#import "HomeLayoutFrame.h"
#import "UserHeaderView.h"
#import "RequestUrlConnection.h"
#import "DetailsModel.h"
#import "DetailsLayoutFrame.h"
#import "DetailsViewController.h"
#import "UIView+UIViewController.h"
#import "PullToDetailsController.h"



@implementation UserTabbleView
{
    NSMutableArray *dataArray;
    
    RequestUrlConnection *_request;
    
        
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
       //  [self loadData];
        
         [self creatTabbleView];
        
        
    }
    
    
    return self;
    
}

-(void)creatTabbleView{
    self.delegate = self;
    
    self.dataSource = self;
    
    
    
    UINib *nib = [UINib nibWithNibName:@"UserCell" bundle:nil];
    
    [self registerNib:nib forCellReuseIdentifier:@"UserCell"];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return _homeData.count;
   
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // NSLog(@"%li",_homeData.count);
    
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" ];
    if (!cell) {
        cell = [[UserCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UserCell"];
    }
    
    HomeLayoutFrame *layout =_homeData[indexPath.section];
    
    cell.pictureImage.backgroundColor = [UIColor colorWithRed:239/255 green:239/255 blue:239/255 alpha:239/255];
    cell.pictureImage.image = [UIImage imageNamed:@"fp_bg.9.png"];


    cell.Homelayout = layout;
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeLayoutFrame *layout = _homeData[indexPath.section];
    
    CGFloat height =  layout.frame.size.height + 80 ;
    
    
    
   
    return height;
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    
    UserHeaderView *headerView = [[UserHeaderView alloc]initWithFrame:tableView.bounds];
    headerView.backgroundColor = [UIColor whiteColor];
    
     HomeLayoutFrame *layout = _homeData[section];
    headerView.layout = layout;
    
    return headerView;
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeLayoutFrame *layout = _homeData[indexPath.section];

    
    [PullToDetailsController pullToDetailsControllerWithController:self.viewController AndPostId:layout.userModel.postId];
    
    
    
}


@end
