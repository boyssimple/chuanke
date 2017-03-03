//
//  INTAdvitise.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTAdvitise.h"

@implementation Resource


- (void)parse:(NSDictionary*)obj{
    self.action = [obj objectForKey:@"action"];;
    self.image = [obj objectForKey:@"image"];
    self.link = [obj objectForKey:@"link"];
    self.position = [[obj objectForKey:@"position"]integerValue];
}

@end

@implementation INTAdvitise
- (id)init{
    self = [super init];
    if (self) {
        _resources = [NSMutableArray array];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{
    self.dmError = [[obj objectForKey:@"dm_error"]integerValue];
    self.errorMsg = [obj objectForKey:@"error_msg"];
    self.md5 = [obj objectForKey:@"md5"];
    
    [self.resources removeAllObjects];
    NSArray *lives = [obj objectForKey:@"resources"];
    for (NSDictionary *data in lives) {
        Resource *res = [[Resource alloc]init];
        [res parse:data];
        [self.resources addObject:res];
    }
}

@end
