//
//  MessageModel.h
//  FootPlace
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"at":"",
//"iscomment":"0",
//"messageText":"择机去吧！她是一个神秘而虔诚的可以荡涤心灵的地方。",
//"messageType":"reply",
//"replyUid":"22479779",
//"replyUserAvatar":"http://q.qlogo.cn/qqapp/1101722328/F25A33BB4E7A32A78A52BB1C3F27A233/100",
//"replyUserName":"逝水流源",
//"resourceId":"43604438",
//"resourceImg":"http://dn.fotoplace.cc/d935931fc02546b89435445473cc241d.jpg-ms",
//"resourceText":"",
//"resourceType":"post",
//"sendAvatar":"http://dn.fotoplace.cc/0afc13e5d0384142a3ef13973f472fac.jpg",
//"sendUid":"19270406",
//"sendUserName":"涵",
//"timestamp":"1445431584000"
#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,strong)NSArray *messages;
-(id)initWithDataDic:(NSDictionary*)dataDic;
@end
