//
//  ZanModel.m
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "ZanModel.h"

@implementation ZanModel
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
