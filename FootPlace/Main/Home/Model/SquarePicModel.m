//
//  SquarePicModel.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/22.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "SquarePicModel.h"

@implementation SquarePicModel
-(id)initWithDataDic:(NSDictionary*)dataDic{
    
    self = [super init];
    if (self) {
        [self setAttributes:dataDic];
        
    }
    return  self;
}
-(void)setAttributes:(NSDictionary *)dataDic{
    _activityImageUrl = dataDic[@"activityImage"];
    _Url = dataDic[@"url"];
    _width = dataDic[@"width"];
    _heigt = dataDic[@"height"];
    _count = dataDic[@"count"];
    _title = dataDic[@"title"];
    _type = dataDic[@"type"];
    _distance = dataDic[@"distance"];
    _postId = dataDic[@"postId"];
    _postImg = dataDic[@"postImg"];
    _postText = dataDic[@"postText"];
    _homePic = dataDic[@"homePic"];
    _imgUrl = dataDic[@"imgUrl"];
    
    _hotAlbumdescription = dataDic[@"description"];//热门影集的title；
    
    
    
    
    
    
}

@end
