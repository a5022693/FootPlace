//
//  SelectionPostView.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/23.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquarePicModel.h"

@interface SelectionPostView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>


@property(nonatomic,strong)NSArray *squareselectionPostArray;

@property(nonatomic,strong)SquarePicModel *model;

@end
