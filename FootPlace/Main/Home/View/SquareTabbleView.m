//
//  SquareTabbleView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/16.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SquareTabbleView.h"
#import "UserCell.h"
#import "SquareLayoutFrame.h"
#import "SquarePictureView.h"
#import "SquarePicTotalData.h"
#import "SquareHeadView.h"
#import "RequestUrlConnection.h"
#import "DetailsModel.h"
#import "DetailsLayoutFrame.h"
#import "DetailsViewController.h"
#import "UIView+UIViewController.h"
#import "PullToDetailsController.h"

@implementation SquareTabbleView

{
    NSMutableArray *dataArray;

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
    
   // self.scrollEnabled = NO;
    
    UINib *nib = [UINib nibWithNibName:@"UserCell" bundle:nil];
    
    [self registerNib:nib forCellReuseIdentifier:@"UserCell"];
    
    
}


-(void)setSquareData:(NSArray *)squareData{
    if (_squareData != squareData) {
        _squareData = squareData;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return _squareData.count;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
       
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" ];
    if (!cell) {
        cell = [[UserCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UserCell"];
    }
    
    SquareLayoutFrame *layout =_squareData[indexPath.section];
    
    cell.Squarelayout = layout;
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SquareHeadView *layout = _squareData[indexPath.section];
    
    CGFloat height =  layout.frame.size.height + 80 ;
    
    return height;
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

     SquareHeadView *headerView = [[SquareHeadView alloc]initWithFrame:tableView.bounds];
    headerView.backgroundColor = [UIColor whiteColor];
    
    SquareLayoutFrame *layout = _squareData[section];
    headerView.layout = layout;
    
    return headerView;
    

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SquareLayoutFrame *layout = _squareData[indexPath.section];
    

    [PullToDetailsController pullToDetailsControllerWithController:self.viewController AndPostId:layout.squareModel.postId];
    
    
}





@end
