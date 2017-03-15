//
//  NetTool.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "NetTool.h"

@implementation NetTool
+(void)requestPostWith:(NSString*)url withParams:(NSMutableDictionary*)params andblock:(void (^)(NSDictionary *dic, NSError *error))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [params setObject:@"{\"os\" : \"iPhone OS9.030200\",\"model\" : \"iPhone8,1\"}" forKey:@"device"];
    [params setObject:@"5991ca105329737f69ab311fbcef758bb1d3d080" forKey:@"cuid"];
    [params setObject:@"3" forKey:@"from"];
    [params setObject:@"1468902921" forKey:@"timestamp"];
    [params setObject:@"2.8.7" forKey:@"client_version"];
    
    
    [manager POST:[NSString stringWithFormat:@"%@%@",BASEURL,url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"这里打印请求成功要做的事:%@",responseObject);
        if (block) {
            block(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);  //这里打印错误信息
        if (block) {
            block(nil, error);
        }
    }];
}

+(void)request:(NSString*)url andblock:(void (^)(NSDictionary *dic, NSError *error))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    // 添加这句代码
    [manager GET:[NSString stringWithFormat:@"%@%@",BASEURL2,url] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSLog(@"这里打印请求成功要做的事:%@",responseObject);
             if (block) {
                 block(responseObject, nil);
             }
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             if (block) {
                 block(nil, error);
             }
             
         }];
}

+(void)requestGetWith:(NSString*)url andblock:(void (^)(NSDictionary *dic, NSError *error))block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 添加这句代码
    [manager GET:[NSString stringWithFormat:@"%@%@",BASEURL,url] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
        NSLog(@"这里打印请求成功要做的事:%@",responseObject);
        if (block) {
            block(responseObject, nil);
        }
    }
     
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
        NSLog(@"%@",error);  //这里打印错误信息
        if (block) {
            block(nil, error);
        }
             
    }];
}
@end
