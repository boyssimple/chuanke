//
//  HomeLikeTable.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
@protocol HomeLikeDelegate;
@interface HomeLikeTable : UIView

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) id<HomeLikeDelegate> delegate;
- (void)reload;
- (CGFloat)calHeight:(NSArray*)arr;
@end

//代理
@protocol HomeLikeDelegate <NSObject>
@required
- (void)selectHomeLike:(Excellent*)data;
@end