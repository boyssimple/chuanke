//
//  HomeRecommentTable.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

@protocol HomeRecommentDelegate;
@interface HomeRecommentTable : UIView

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) id<HomeRecommentDelegate> delegate;
- (void)reload;

@end

//代理
@protocol HomeRecommentDelegate <NSObject>
@required
- (void)selectHomeRecomment:(Recommend*)data;
@end
