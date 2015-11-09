//
//  ConcernModel.h
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"avatar":"http://dn.fotoplace.cc/883196572cd24359bd1deb51ccf1ba98.jpg",
//"description":"Lauyu",
//"distance":"0",
//"isFollowing":"1",
//"isFollowingMe":"0",
//"uid":"22424992",
//"userName":"Jimanna"
#import <Foundation/Foundation.h>

@interface ConcernModel : NSObject
@property(nonatomic,strong)NSArray *messages;
-(id)initWithDataDic:(NSDictionary*)dataDic;

@end
