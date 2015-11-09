//
//  ShuiYin.h
//  第三天作业
//
//  Created by mac on 15/9/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ShuiYin : NSObject

//制作水印的方法
+ (UIImage *)watermaskimage:(UIImage *)image text:(NSString *)text ENtext:(NSString *)ENtext;
@end
