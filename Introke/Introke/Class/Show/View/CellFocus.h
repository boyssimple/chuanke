//
//  CellFocus.h
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntFocus.h"
@interface CellFocus : UITableViewCell
- (void)updateData:(IntLive*)live;
+ (CGFloat)calHeight;
@end
