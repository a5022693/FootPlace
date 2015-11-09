//
//  RequestUrlConnection.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface RequestUrlConnection : NSObject


+(void)requestWithUrlString:(NSString *)urlString Parameters:(id)params Method:(NSString *)method FinishBlock:(void(^)(id result))block;
@end
