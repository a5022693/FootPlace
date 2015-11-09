//
//  GoodViewController.h
//  FootPlace
//
//  Created by mac on 15/11/1.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"
#import "ZanModel.h"    
@interface GoodViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *celldata;


@end
