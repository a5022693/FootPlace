//
//  UserModel.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/17.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

//初始化方法
-(id)initWithDataDic:(NSDictionary*)dataDic{
    
    self = [super init];
    if (self) {
        [self setAttributes:dataDic];
        
    }
    return  self;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    _pictureImageUrl = dataDic[@"bigUrl"];
        _contextText = dataDic[@"content"];
    _loverCount = dataDic[@"likeCount"];
    _commentCount = dataDic[@"commentCount"];
  //  _ProfileImageUrl = dataDic[@"avatar"];
    _pictureWidth = dataDic[@"width"];
    _pictureHeight = dataDic[@"height"];
    
    _commentList = dataDic[@"commentList"];
    
    _avatar = dataDic[@"avatar"];
    _nickName = dataDic[@"nickName"];
    
    _postId = dataDic[@"postId"];
    
 //   NSLog(@"%@",dataDic);
    
    
    
    
    
}
@end
