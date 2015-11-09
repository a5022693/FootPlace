//
//  ConcernViewController.h
//  FootPlace
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"
#import "ConcernModel.h"
@interface ConcernViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *celldata;

@end
