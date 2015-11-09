//
//  PullToDetailsController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "PullToDetailsController.h"
#import "RequestUrlConnection.h"
#import "DetailsViewController.h"
#import "DetailsModel.h"
#import "DetailsLayoutFrame.h"


@implementation PullToDetailsController


+(void)pullToDetailsControllerWithController:(UIViewController *)viewController AndPostId:(NSString *)postId{
    
    
    postId = [NSString stringWithFormat:@"postId=%@",postId];
    
    
    NSString *url = @"http://www.fotoplace.cc/api/square/post_detail.do?clientVersion=2.9&seriesNumber=864784020614156&osType=android4.4.2-LENOVOLenovo%20K920&version=3.0.3&uid=22479779&token=ba4ca09477864981bf3da0c8e659b0930b49b37f99554483a0bdbb49d67117e5";
    
    
    NSString *urlStr = [url stringByAppendingFormat:@"&%@",postId];
    
    NSLog(@"%@",urlStr);
    
    [RequestUrlConnection requestWithUrlString:urlStr Parameters:nil Method:@"POST" FinishBlock:^(id result) {
        
        NSDictionary *dic = result;
        DetailsModel *model = [[DetailsModel alloc]initWithDataDic:dic];
        
        DetailsLayoutFrame *layout = [[DetailsLayoutFrame alloc]init];
        
        layout.model = model;
        
        
        DetailsViewController *detailsViewController = [[DetailsViewController alloc]init];
        detailsViewController.view.backgroundColor = [UIColor whiteColor];
        
        detailsViewController.layout = layout;
        
        [viewController.navigationController pushViewController:detailsViewController animated:YES];
        
        
    }];
    

    
    
    
}
@end
