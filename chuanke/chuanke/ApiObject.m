//
//  ApiObject.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "ApiObject.h"

@implementation ApiObject

- (void)parse:(NSDictionary*)obj{
    self.result = [obj objectForKey:@"result"];
    self.desc = [obj objectForKey:@"description"];
}
@end
