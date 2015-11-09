//
//  DetailsModel.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsModel : NSObject


@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,copy)NSString *fakePostId;
@property(nonatomic,copy)NSString *imgHeight;
@property(nonatomic,copy)NSString *imgWidth;
@property(nonatomic,copy)NSString *isFollowing;
@property(nonatomic,copy)NSString *imgUrlBig;
@property(nonatomic,copy)NSString *isLiking;
@property(nonatomic,copy)NSString *likeCount;
@property(nonatomic,copy)NSString *timestamp;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *postId;

@property(nonatomic,strong)NSArray *likes;
@property(nonatomic,strong)NSArray *comments;







-(id)initWithDataDic:(NSDictionary*)dataDic;
@end
