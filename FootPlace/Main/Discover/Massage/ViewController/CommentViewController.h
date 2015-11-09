//
//  CommentViewController.h
//  FootPlace
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"
#import "MessageModel.h"
@interface CommentViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *celldata;

@end
