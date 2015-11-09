//
//  SquareTabbleView.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/16.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquareTabbleView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *squareData;
//@property(nonatomic,strong)NSDictionary *squarePicData;

@end
