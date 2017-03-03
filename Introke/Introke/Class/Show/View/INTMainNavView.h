//
//  INTMainNavView.h
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol INTMainNavViewDelegate <NSObject>

- (void)navBarTitleClick:(NSInteger)index;

@end

@interface INTMainNavView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray*)titles;
@property (nonatomic, weak) id<INTMainNavViewDelegate> delegate;

- (void)selectIndex:(NSInteger)index;
@end

