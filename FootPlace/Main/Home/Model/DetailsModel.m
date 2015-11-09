//
//  DetailsModel.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DetailsModel.h"

@implementation DetailsModel

-(id)initWithDataDic:(NSDictionary*)dataDic{
    
    self = [super init];
    if (self) {
        
        NSDictionary *data = dataDic[@"data"];
        
        [self setAttributes:data];
            
    }
    return  self;
    
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    
    _address = dataDic[@"address"];
    _avatar =  dataDic[@"avatar"];
    _userName = dataDic[@"userName"];
    _likeCount = dataDic[@"likeCount"];
    _commentCount = dataDic[@"commentCount"];
    _imgHeight = dataDic[@"imgHeight"];
    _imgWidth = dataDic[@"imgWidth"];
    _imgUrlBig = dataDic[@"imgUrlBig"];
    _uid = dataDic[@"commentCount"];
    _text = dataDic[@"text"];
    _likes = dataDic[@"likes"];
    _comments = dataDic[@"comments"];
    _postId = dataDic[@"id"];
    
    
    
    
}

@end
