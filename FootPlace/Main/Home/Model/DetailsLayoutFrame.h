//
//  DetailsLayoutFrame.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/28.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailsModel.h"
#import <UIKit/UIKit.h>

@interface DetailsLayoutFrame : NSObject

@property(nonatomic,strong)DetailsModel *model;


@property (nonatomic,assign) CGRect imageViewFrame;
@property (nonatomic,assign) CGRect contextFrame;
@property (nonatomic,assign) CGRect likesFrame;

@property (nonatomic,assign) CGRect addressFrame;


@end
