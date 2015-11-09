//
//  HomeLayoutFrame.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/17.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import <UIKit/UIKit.h> 
#import "SquareModel.h"



@interface HomeLayoutFrame : NSObject

@property (nonatomic,assign) CGRect contextFrame;// 用户发送的内容
@property (nonatomic,assign) CGRect commentFrame1;//评论的内容
@property (nonatomic,assign) CGRect commentFrame2;//评论的内容
@property (nonatomic,assign) CGRect commentFrame3;//评论的内容
@property (nonatomic,assign) CGRect bgImageFrame;
@property (nonatomic,assign) CGRect pictureFrame;//用户发的图片
@property (nonatomic,assign) CGRect loveCountImageFrame;
@property (nonatomic,assign) CGRect commentCountImageFrame;
@property (nonatomic,assign) CGRect loveCountFrame;
@property (nonatomic,assign) CGRect commentCountFrame;
@property (nonatomic,assign) CGRect frame;//整个cell的frame


@property (nonatomic,strong) NSMutableArray *commentArray;

@property (nonatomic,assign) CGRect loveBtnFrame;
@property (nonatomic,assign) CGRect commentBtnFrame;
@property (nonatomic,assign) CGRect replayBtnFrame;



@property (nonatomic,strong) UserModel *userModel;

@end
