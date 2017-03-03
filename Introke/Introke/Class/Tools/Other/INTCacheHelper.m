//
//  INTCacheHelper.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTCacheHelper.h"

@implementation INTCacheHelper

+ (NSString*)getAdImage{
    return [[NSUserDefaults standardUserDefaults]objectForKey:@"adImage"];
}

+ (void)setAdImage:(NSString*)adImage{
    [[NSUserDefaults standardUserDefaults]setObject:adImage forKey:@"adImage"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
