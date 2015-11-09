//
//  RequestUrlConnection.m
//  FootPlace
//
//  Created by wangchengyuan on 15/10/27.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "RequestUrlConnection.h"
#import "AFNetworking.h"

@implementation RequestUrlConnection


+(void)requestWithUrlString:(NSString *)urlString Parameters:(id)params Method:(NSString *)method FinishBlock:(void (^)(id))block{
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    
    NSMutableURLRequest *Request = [requestSerializer requestWithMethod:method URLString:urlString parameters:params error:nil];
    
    //构造连接对象
    
    AFHTTPRequestOperation *Operation = [[AFHTTPRequestOperation alloc]initWithRequest:Request];
    
   
    
    Operation.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [Operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
      
        
        block(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"RequsestFailed");
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue setMaxConcurrentOperationCount:1];
    
    [queue addOperation:Operation];
   
    
    
}



    
@end
