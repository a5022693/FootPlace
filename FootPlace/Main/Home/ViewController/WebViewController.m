//
//  WebViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/11/2.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController
{
    UIView *_headView;
    UIWebView *_webView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    
    [self _creatViews];
    // Do any additional setup after loading the view.
}

-(void)_creatViews{
    
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    
    [self.view addSubview:_headView];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 44, 44)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"album_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_headView addSubview:backBtn];
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeigth)];
    [self.view addSubview:_webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_webViewUrl]];
    
    [_webView loadRequest:request];
}

-(void)backAction{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
