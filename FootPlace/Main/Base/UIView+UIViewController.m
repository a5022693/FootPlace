//
//  UIView+UIViewController.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/28.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)


-(UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }
    
    return nil;
    
}
@end
