//
//  UserHeaderView.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/19.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "UserHeaderView.h"
#import "UIImageView+WebCache.h"

@implementation UserHeaderView



-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
    
    }
    return self;
}
-(void)setLayout:(HomeLayoutFrame *)layout{
    
    if (_layout != layout) {
        _layout = layout;
    }
    [self setNeedsLayout];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,5, 40, 40)];
    
    headImageView.layer.cornerRadius = 20;
    
    NSString *headerImamgeUrl = _layout.userModel.avatar;
    
    [headImageView sd_setImageWithURL:[NSURL URLWithString:headerImamgeUrl]];
    
    headImageView.layer.masksToBounds = YES;
    
    [self addSubview:headImageView];
    
    UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame)+10, 15, 120, 15)];
    nickName.text = _layout.userModel.nickName;
    nickName.font = [UIFont systemFontOfSize:15];
    
    [self addSubview:nickName];
    
    
    
    
    
    
}
@end
