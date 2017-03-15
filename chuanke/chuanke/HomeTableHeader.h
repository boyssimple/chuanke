//
//  HomeTableHeader.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableHeader : UIView
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *more;
@property (nonatomic, strong) UIImageView *arrowRight;
@property (nonatomic, strong) UIView *line;
- (void)hiddenMore;
@end
