//
//  ProfileViewController.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"

@interface ProfileViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UILabel *datalabel1;
    UILabel *datalabel2;
    UILabel *datalabel3;
    UILabel *datalabel4;
}
@end
