//
//  ProfileModel.h
//  FootPlace
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//
//"albumCount":"0",影集
//"allowFound":"1",
//"avatar":"http://q.qlogo.cn/qqapp/1101722328/F25A33BB4E7A32A78A52BB1C3F27A233/100",头像
//"city":"0",
//"createAt":"1438179000000",
//"description":"随便写点什么吧",签名
//"followerCount":"1",粉丝
//"followingCount":"9",关注
//"gender":"",性别
//"isFollowing":"0",
//"likeCount":"2",赞
//"location":"",地点
//"newCommentCount":"0",新评论
//"newLikeCount":"0",新赞
//"newMessageCount":"0",新消息
//"newMsgCount":"0",
//"newNoticeCount":"0",
//"newNotifyCount":"0",
//"newTotalCount":"0",
//"postCount":"1",
//"stopbyCount":"0",
//"tagCount":"0",
//"uid":"22479779",足记号
//"userName":"逝水流源",用户姓名
//"userSkin":"",
//"wishCount":"0"
#import <Foundation/Foundation.h>

@interface ProfileModel : NSObject


@property(nonatomic,copy)NSString *albumCount;//影集
@property(nonatomic,copy)NSString *followerCount;//粉丝
@property(nonatomic,copy)NSString *followingCount;//关注
@property(nonatomic,copy)NSString *likeCount;//赞
@property(nonatomic,copy)NSString *avatar;//头像
@property(nonatomic,copy)NSString *location;//地点
@property(nonatomic,copy)NSString *uid;//足记号
@property(nonatomic,copy)NSString *userName;//用户姓名
//@property(nonatomic,copy)NSString *albumCount;
//@property(nonatomic,copy)NSString *albumCount;
-(id)initWithDataDic:(NSDictionary*)dataDic;
@end

