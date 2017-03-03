//
//  INTLocationManager.h
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INTLocationManager : NSObject
+ (INTLocationManager*)sharedManager;
- (void)getGps;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@end
