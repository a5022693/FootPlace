//
//  SquarePicModel.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/22.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"type":"2",
//"activityId":"522",
//"title":"52岁的无厘头读书人要完成导演梦",
//"subtitle":"",
//"count":"0",
//"activityImage":"http://dn.fotoplace.cc/fp5771689.jpg-ms?t=443702",
//"url":"http://mp.weixin.qq.com/s?__biz=MzA3ODI5MDcxMQ==&mid=400164347&idx=1&sn=af790d222374f4e855136e840946d9a0#rd",
//"width":"750",
//"height":"304",
//"startTime":"2015.10.22 04:10:53",
//"endTime":"2015.10.30 04:10:53"

#import <Foundation/Foundation.h>

@interface SquarePicModel : NSObject
@property(nonatomic,copy)NSString *activityImageUrl;
@property(nonatomic,copy)NSString *Url;
@property(nonatomic,copy)NSString *width;
@property(nonatomic,copy)NSString *heigt;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *postId;
@property(nonatomic,copy)NSString *postImg;
@property(nonatomic,copy)NSString *postText;
@property(nonatomic,copy)NSString *homePic;
@property(nonatomic,copy)NSString *hotAlbumdescription;
@property(nonatomic,copy)NSString *imgUrl;






-(id)initWithDataDic:(NSDictionary*)dataDic;
@end
