//
//  HomeSpecialTable.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
@protocol HomeSpecialDelegate;
@interface HomeSpecialTable : UIView
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) id<HomeSpecialDelegate> delegate;

- (void)reload;
- (CGFloat)calHeight;
@end


//代理
@protocol HomeSpecialDelegate <NSObject>
@required
- (void)selectHomeSpecial:(Album*)data;
@end