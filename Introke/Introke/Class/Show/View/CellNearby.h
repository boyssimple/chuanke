//
//  CellNearby.h
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INTNear.h"

@interface CellNearby : UICollectionViewCell
@property (nonatomic, strong) IntNearLive *near;
- (void)showAnimation;
@end
