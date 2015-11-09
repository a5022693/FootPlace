//
//  ZanModel.h
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"at":"",
//"iscomment":"",
//"messageText":"",
//"messageType":"like",
//"replyUid":"0",
//"replyUserAvatar":"",
//"replyUserName":"山野",
//"resourceId":"43596211",
//"resourceImg":"http://dn.fotoplace.cc/743891784fc340059dbfb4794fa6420f.jpg-mb",
//"resourceText":"",
//"resourceType":"post",
//"sendAvatar":"http://dn.fotoplace.cc/b16738918ef645d785d0dfe607341977.jpg",
//"sendUid":"18284336",
//"sendUserName":"山野",
//"timestamp":"1446319510000"
#import <Foundation/Foundation.h>

@interface ZanModel : NSObject
@property(nonatomic,strong)NSArray *messages;
-(id)initWithDataDic:(NSDictionary*)dataDic;
@end
