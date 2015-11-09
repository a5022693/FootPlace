//
//  NotificationModel.h
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"isFollowing":"1",
//"messageText":"",
//"replyUid":"0",
//"resourceId":"",
//"resourceImg":"http://dn.fotoplace.ccnull",
//"resourceType":"",
//"sendAvatar":"http://wx.qlogo.cn/mmopen/fic8lxuUx8YBFSlLAicNmkaHrtn5ia2qKRx6BicFdHVP9pUzLXicyAzEvdsty5myRcJ9VhicukiaRT2JnLdWNnPOmAu1ZUD0XYV0XIy/0",
//"sendUid":"2431220",
//"sendUserName":"baimama",
//"timestamp":"1445522520000"
#import <Foundation/Foundation.h>

@interface NotificationModel : NSObject
@property(nonatomic,strong)NSArray *messages;
-(id)initWithDataDic:(NSDictionary*)dataDic;


@end
