//
//  INTNear.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTNear.h"

@implementation INtNearCreator

- (void)parse:(NSDictionary*)obj{
    self.gender = [[obj objectForKey:@"gender"]integerValue];
    self.idField = [[obj objectForKey:@"id"]integerValue];
    self.level = [[obj objectForKey:@"level"]integerValue];
    self.nick = [obj objectForKey:@"nick"];
    self.portrait = [obj objectForKey:@"portrait"];
}

@end

@implementation IntNearLive
- (id)init{
    self = [super init];
    if (self) {
        self.creator = [[INtNearCreator alloc]init];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{
    [self.creator parse:[obj objectForKey:@"creator"]];
    self.idField = [obj objectForKey:@"id"];
    self.name = [obj objectForKey:@"name"];
    self.city = [obj objectForKey:@"city"];
    self.shareAddr = [obj objectForKey:@"share_addr"];
    self.streamAddr = [obj objectForKey:@"stream_addr"];
    self.version = [[obj objectForKey:@"version"]integerValue];
    self.slot = [[obj objectForKey:@"slot"]integerValue];
    self.optimal = [[obj objectForKey:@"optimal"]integerValue];
    self.group = [[obj objectForKey:@"expire_time"]integerValue];
    self.distance = [obj objectForKey:@"distance"];
    self.link = [[obj objectForKey:@"link"]integerValue];
    self.multi = [[obj objectForKey:@"multi"]integerValue];
}

@end

@implementation INTNear
- (id)init{
    self = [super init];
    if (self) {
        _lives = [NSMutableArray array];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{
    self.dmError = [[obj objectForKey:@"dm_error"]integerValue];
    self.errorMsg = [obj objectForKey:@"error_msg"];
    self.expireTime = [[obj objectForKey:@"expire_time"]integerValue];
    [self.lives removeAllObjects];
    NSArray *lives = [obj objectForKey:@"lives"];
    for (NSDictionary *data in lives) {
        IntNearLive *live = [[IntNearLive alloc]init];
        [live parse:data];
        [self.lives addObject:live];
    }
}

@end
