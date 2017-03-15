//
//  BarButton.m
//  chuanke
//
//  Created by zhouMR on 16/7/20.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "BarButton.h"

@interface BarButton()
@end

@implementation BarButton

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivIcon = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:_ivIcon];
        
        _lbText = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbText.font = [UIFont systemFontOfSize:12];
        _lbText.textColor = [UIColor grayColor];
        _lbText.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbText];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.ivIcon.frame = CGRectMake(0, 0, self.width, 25);
    self.lbText.frame = CGRectMake(0, self.ivIcon.top+5, self.width, 12);
}
@end
