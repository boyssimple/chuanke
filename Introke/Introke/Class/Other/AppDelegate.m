//
//  AppDelegate.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "AppDelegate.h"
#import "VCTabBar.h"
#import "INTAdvitiseView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController * mainVC = [[VCTabBar alloc] init];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    INTAdvitiseView *adsView = [[INTAdvitiseView alloc]init];
    [self.window addSubview:adsView];
    
    return YES;
}



@end
