//
//  MovieViewController.h
//  FootPlace
//
//  Created by mac on 15/11/3.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"

@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *movieTextArray;
@end
