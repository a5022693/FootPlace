//
//  FansModel.h
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"avatar":"http://wx.qlogo.cn/mmopen/fic8lxuUx8YBFSlLAicNmkaHrtn5ia2qKRx6BicFdHVP9pUzLXicyAzEvdsty5myRcJ9VhicukiaRT2JnLdWNnPOmAu1ZUD0XYV0XIy/0",
//"description":"",
//"distance":"0",
//"isFollowing":"1",
//"isFollowingMe":"1",
//"uid":"2431220",
//"userName":"baimama"
#import <Foundation/Foundation.h>

@interface FansModel : NSObject
@property(nonatomic,strong)NSArray *messages;
-(id)initWithDataDic:(NSDictionary*)dataDic;
@end
