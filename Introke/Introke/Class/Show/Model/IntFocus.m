//
//  IntFocus.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "IntFocus.h"

@implementation IntCreator

- (void)parse:(NSDictionary*)obj{
    self.birth = [obj objectForKey:@"birth"];
    self.descriptionField = [obj objectForKey:@"description"];
    self.emotion = [obj objectForKey:@"emotion"];
    self.gender = [[obj objectForKey:@"gender"]integerValue];
    self.gmutex = [[obj objectForKey:@"gmutex"]integerValue];
    self.hometown = [obj objectForKey:@"hometown"];
    self.idField = [[obj objectForKey:@"id"]integerValue];
    self.inkeVerify = [[obj objectForKey:@"inke_verify"]integerValue];
    self.level = [[obj objectForKey:@"level"]integerValue];
    self.location = [obj objectForKey:@"location"];
    self.nick = [obj objectForKey:@"nick"];
    self.portrait = [obj objectForKey:@"portrait"];
    self.profession = [obj objectForKey:@"profession"];
    self.rankVeri = [[obj objectForKey:@"rank_veri"]integerValue];
    self.thirdPlatform = [obj objectForKey:@"third_platform"];
    self.veriInfo = [obj objectForKey:@"veri_info"];
    self.verified = [[obj objectForKey:@"verified"]integerValue];
    self.verifiedReason = [obj objectForKey:@"verified_reason"];
}

@end

@implementation IntLive
- (id)init{
    self = [super init];
    if (self) {
        self.creator = [[IntCreator alloc]init];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{
    self.city = [obj objectForKey:@"city"];
    [self.creator parse:[obj objectForKey:@"creator"]];
    self.group = [[obj objectForKey:@"expire_time"]integerValue];
    self.idField = [obj objectForKey:@"id"];
    self.image = [obj objectForKey:@"image"];
    self.link = [[obj objectForKey:@"link"]integerValue];
    self.multi = [[obj objectForKey:@"multi"]integerValue];
    self.name = [obj objectForKey:@"name"];
    self.onlineUsers = [[obj objectForKey:@"online_users"]integerValue];
    self.optimal = [[obj objectForKey:@"optimal"]integerValue];
    self.pubStat = [[obj objectForKey:@"pub_stat"]integerValue];
    self.roomId = [[obj objectForKey:@"room_id"]integerValue];
    self.shareAddr = [obj objectForKey:@"share_addr"];
    self.slot = [[obj objectForKey:@"slot"]integerValue];
    self.status = [[obj objectForKey:@"status"]integerValue];
    self.streamAddr = [obj objectForKey:@"stream_addr"];
    self.version = [[obj objectForKey:@"version"]integerValue];
}

@end

@implementation IntFocus
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
        IntLive *live = [[IntLive alloc]init];
        [live parse:data];
        [self.lives addObject:live];
    }
}

@end
