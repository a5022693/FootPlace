//
//  SquareModel.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SquareModel.h"

@implementation SquareModel

//初始化方法
-(id)initWithDataDic:(NSDictionary*)dataDic{
    
    self = [super init];
    if (self) {
        [self setAttributes:dataDic];
        
    }
    return  self;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
   
    
    _pictureImageUrl = dataDic[@"imgUrl"];
    _contextText = dataDic[@"text"];
    _loverCount = dataDic[@"likeCount"];
    _commentCount = dataDic[@"commentCount"];
   
    _pictureWidth = dataDic[@"imgWidth"];
    _pictureHeight = dataDic[@"imgHeight"];
    
    _commentList = dataDic[@"comments"];
    
    _avatar = dataDic[@"avatar"];
    _nickName = dataDic[@"userName"];
    
    _postId = dataDic[@"id"];
    
    
    
    
}

@end
