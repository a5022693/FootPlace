//
//  ConfigViewController.h
//  FootPlace
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"
#import "ProfileModel.h"
@interface ConfigViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@property(nonatomic,strong)ProfileModel *model;
@end
