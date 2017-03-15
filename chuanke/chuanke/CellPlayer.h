//
//  CellPlayer.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
@interface CellPlayer : UITableViewCell
- (void)updateData:(CsClass*)data;

- (void)hiddenLine:(int)type;
@end
