//
//  SquarePicTotalData.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/23.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SquarePicModel.h"

@interface SquarePicTotalData : NSObject


@property(nonatomic,strong)NSArray *squarePicData; //
@property(nonatomic,strong)NSArray *squareHotPostArray;
@property(nonatomic,strong)NSArray *squarehotAlbumArray;
@property(nonatomic,strong)NSArray *squarenearPostArray;


@property(nonatomic,strong)NSArray *squarenewUserWorkArray;
@property(nonatomic,strong)NSArray *squareselectionPostArray;
@property(nonatomic,strong)NSArray *squareNewPostArray;

@property(nonatomic,strong)NSArray *squaretagsArray;


@property(nonatomic,strong)SquarePicModel *model;




@end
