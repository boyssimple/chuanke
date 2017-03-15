//
//  PQFullView.h
//  PentaQMovie
//
//  Created by zhouMR on 16/3/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
static UIWindow *pQFullViewWindow = nil;
@interface PQFullView : UIWindow

@property(nonatomic,strong)UIView *view;
- (void)show;
- (void)dismiss;
@end
