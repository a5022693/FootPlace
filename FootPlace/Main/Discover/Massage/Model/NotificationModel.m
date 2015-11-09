//
//  NotificationModel.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "NotificationModel.h"

@implementation NotificationModel
-(id)initWithDataDic:(NSDictionary *)dataDic
{
    self = [super init];
    if(self)
    {
        NSDictionary *data = dataDic[@"data"];
        
        //NSArray
        [self setAttributes:data];
    }
    return self;
}

-(void)setAttributes:(NSDictionary *)dataDic
{
    _messages = dataDic[@"messages"];
    
    
}

@end
