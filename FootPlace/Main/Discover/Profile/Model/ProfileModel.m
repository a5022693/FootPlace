//
//  ProfileModel.m
//  FootPlace
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "ProfileModel.h"

@implementation ProfileModel

-(id)initWithDataDic:(NSDictionary *)dataDic
{
    self = [super init];
    if(self)
    {
        NSDictionary *data = dataDic[@"data"];
        [self setAttributes:data];
    }
    return self;
}

-(void)setAttributes:(NSDictionary *)dataDic
{
    _albumCount = dataDic[@"albumCount"];
    _followerCount = dataDic[@"followerCount"];
    _followingCount = dataDic[@"followingCount"];
    _likeCount = dataDic[@"likeCount"];
    _avatar = dataDic[@"avatar"];
    _location = dataDic[@"location"];
    _uid = dataDic[@"uid"];
    _userName = dataDic[@"userName"];
    
}
@end
