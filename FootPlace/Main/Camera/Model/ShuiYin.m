//
//  ShuiYin.m
//  第三天作业
//
//  Created by mac on 15/9/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShuiYin.h"

@implementation ShuiYin

+ (UIImage *)watermaskimage:(UIImage *)image text:(NSString *)text ENtext:(NSString *)ENtext
{
    //1.建立位图上下文
    UIGraphicsBeginImageContext(image.size);
    
    //2.绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //3.绘制水印文字
    UIFont *font = [UIFont systemFontOfSize:60];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.alignment = NSTextAlignmentCenter;
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *dic=@{
                        NSFontAttributeName : font,
                        NSParagraphStyleAttributeName : style,
                        NSForegroundColorAttributeName : color
                        };
    //4.绘制文字
    [text drawInRect:CGRectMake(0, image.size.height/5*4, image.size.width, 200) withAttributes:dic];
    //5.绘制英文文字
    [ENtext drawInRect:CGRectMake(0, image.size.height/5*4+70, image.size.width, 200) withAttributes:dic];

    //6.获取图片
    UIImage *waterImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return waterImage;
    
    
}

@end
