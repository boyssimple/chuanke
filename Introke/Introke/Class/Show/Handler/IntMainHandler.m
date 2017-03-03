//
//  IntMainHandler.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "IntMainHandler.h"
#import "HttpTool.h"
#import "IntFocus.h"
#import "INTNear.h"
#import "INTAdvitise.h"
#import "INTLocationManager.h"

@implementation IntMainHandler

+ (void)excuteFocusWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail{
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        IntFocus *focus = [[IntFocus alloc]init];
        [focus parse:json];
        if (focus.dmError) {
            fail(focus.errorMsg);
        }else{
            success(focus);
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}

+ (void)excuteNearWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail{
    INTLocationManager *manager = [INTLocationManager sharedManager];
    NSDictionary *params = @{@"uid":@"85149891",@"latitude":manager.latitude,@"longitude":manager.longitude};
    [HttpTool getWithPath:API_NearLocation params:params success:^(id json) {
        INTNear *near = [[INTNear alloc]init];
        [near parse:json];
        if (near.dmError) {
            fail(near.errorMsg);
        }else{
            success(near);
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}


+ (void)excuteAdvitiseWithSuccess:(SuccessBlock)success withFail:(FailureBlock)fail{
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        INTAdvitise *ads = [[INTAdvitise alloc]init];
        [ads parse:json];
        if (ads.dmError) {
            fail(ads.errorMsg);
        }else{
            success(ads);
        }
    } failure:^(NSError *error) {
        fail(error);
    }];
}


@end
