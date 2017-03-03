//
//  CstTabBar.h
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, INTItemType) {
    INTItemTypeLaunch = 10,
    INTItemTypeLive = 100,
    INTItemTypeMe,
};

@class CstTabBar;

@protocol CstTabBarDelegate <NSObject>

- (void)tabbar:(CstTabBar *)tabbar clickIndex:(INTItemType)index;

@end

@interface CstTabBar : UIView
@property (nonatomic, weak) id<CstTabBarDelegate> delegate;
@end
