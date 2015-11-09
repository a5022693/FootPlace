//
//  CameraViewController.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/15.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNaviController.h"

@interface CameraViewController : BaseViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)NSString *str;
//@property(nonatomic,strong)UIImage *image;
@property(nonatomic,copy)NSString *imageText;
@property(nonatomic,strong)UIImageView *imageView;
@end
