//
//  IntFocus.h
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntCreator : NSObject
@property (nonatomic, strong) NSString * birth;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * emotion;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger gmutex;
@property (nonatomic, strong) NSString * hometown;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger inkeVerify;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;
@property (nonatomic, strong) NSString * profession;
@property (nonatomic, assign) NSInteger rankVeri;
@property (nonatomic, strong) NSString * thirdPlatform;
@property (nonatomic, strong) NSString * veriInfo;
@property (nonatomic, assign) NSInteger verified;
@property (nonatomic, strong) NSString * verifiedReason;
- (void)parse:(NSDictionary*)obj;
@end


@interface IntLive : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) IntCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;
- (void)parse:(NSDictionary*)obj;

@end

@interface IntFocus : NSObject

@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) NSInteger expireTime;
@property (nonatomic, strong) NSMutableArray * lives;
- (void)parse:(NSDictionary*)obj;
@end
