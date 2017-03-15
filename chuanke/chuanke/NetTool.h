//
//  NetTool.h
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"

@interface NetTool : NSObject
+(void)requestPostWith:(NSString*)url withParams:(NSMutableDictionary*)params andblock:(void (^)(NSDictionary *dic, NSError *error))block;
+(void)requestGetWith:(NSString*)url andblock:(void (^)(NSDictionary *dic, NSError *error))block;

//接口地址不同
+(void)request:(NSString*)url andblock:(void (^)(NSDictionary *dic, NSError *error))block;

@end
