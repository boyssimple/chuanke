//
//  IntMainHandler.h
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntMainHandler : IntBaseHandler
+ (void)excuteFocusWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail;

+ (void)excuteNearWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail;

+ (void)excuteAdvitiseWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail;
@end
