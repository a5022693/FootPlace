//
//  SquareModel.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SquareModel : NSObject

@property(nonatomic,copy)NSString *pictureImageUrl;
@property(nonatomic,copy)NSString *contextText;
@property(nonatomic,copy)NSString *loverCount;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,copy)NSString *pictureHeight;
@property(nonatomic,copy)NSString *pictureWidth;
@property(nonatomic,copy)NSArray *commentList;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *postId;


-(id)initWithDataDic:(NSDictionary*)dataDic;


@end
