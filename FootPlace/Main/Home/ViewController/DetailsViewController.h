//
//  DetailsViewController.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsLayoutFrame.h"
#import "BaseViewController.h"

@interface DetailsViewController : BaseViewController
<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)DetailsLayoutFrame *layout;


@end
