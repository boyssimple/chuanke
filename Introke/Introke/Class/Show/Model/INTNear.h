//
//  INTNear.h
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface INtNearCreator : NSObject
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;
- (void)parse:(NSDictionary*)obj;
@end

@interface IntNearLive : NSObject

@property (nonatomic, strong) INtNearCreator * creator;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * distance;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, getter=isShow) BOOL show;
- (void)parse:(NSDictionary*)obj;
@end


@interface INTNear : NSObject
@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) NSInteger expireTime;
@property (nonatomic, strong) NSMutableArray * lives;
- (void)parse:(NSDictionary*)obj;
@end
