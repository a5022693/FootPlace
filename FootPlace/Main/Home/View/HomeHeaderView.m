//
//  HomeHeaderView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/20.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView
{
    
   
}


-(instancetype)init{
    self = [super init];
    
    if (self) {
        
        [self _creatHeaderView];
        
        self.backgroundColor = [UIColor  colorWithRed:(76/255.0) green:(75/255.0) blue:(74/255.0) alpha:1];
        self.clipsToBounds = YES;
        
    
    }
    
    return self;
    
}

-(void)dealloc{

    
    
}

-(void)_creatHeaderView{
    
    _squareBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/2+35, 35, 22, 17)];
    [_squareBtn setImage:[UIImage imageNamed:@"square_icon_normal"] forState:UIControlStateNormal];
    [_squareBtn setImage:[UIImage imageNamed:@"square_icon_select"] forState:UIControlStateSelected];
    //squareBtn.selected = YES;
    
    [_squareBtn addTarget:self action:@selector(squareAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_squareBtn];
    
    _concernBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/2-65, 35, 22, 15)];
    
    [_concernBtn setImage:[UIImage imageNamed:@"concern_icon_normal"] forState:UIControlStateNormal];
    [_concernBtn setImage:[UIImage imageNamed:@"concern_icon_select.png"] forState:UIControlStateSelected];
    _concernBtn.selected = NO;
     [_concernBtn addTarget:self action:@selector(concernAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_concernBtn];
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth-40, 33, 20, 20)];
    [searchBtn setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    
    [self addSubview:searchBtn];
    
 
    
    
    
    
    _squareText = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth/2+35,68, 30, 15)];
    _squareText.text = @"广场";
    _squareText.textColor = [UIColor whiteColor];
    _squareText.font = [UIFont systemFontOfSize:13];
    //   squareText.backgroundColor = [UIColor whiteColor];
    //squareText.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_squareText];
    
    _concernText = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth/2-65,68, 30, 15)];
    //concernText.textAlignment= NSTextAlignmentCenter;
    _concernText.text = @"关注";
    _concernText.textColor= [UIColor whiteColor];
    _concernText.font = [UIFont systemFontOfSize:13];
    [self addSubview: _concernText];
    
    
}
-(void)concernAction{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tapConcern" object:nil];
    
    
        
   
    
}
-(void)squareAction{
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tapSquare" object:nil];
    
}
@end
