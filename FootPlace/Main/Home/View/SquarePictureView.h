//
//  SquarePictureView.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/22.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquarePicModel.h"
#import "SquarePicTotalData.h"

@interface SquarePictureView : UIView<UIScrollViewDelegate>



@property(nonatomic,strong)SquarePicTotalData *totalData;

@end
