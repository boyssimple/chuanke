//
//  HomeTableHeader.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HomeTableHeader.h"

@implementation HomeTableHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _name = [[UILabel alloc]initWithFrame:CGRectZero];
        _name.font = [UIFont systemFontOfSize:14];
        _name.textColor = [UIColor blackColor];
        [self addSubview:_name];
        
        _more = [[UILabel alloc]initWithFrame:CGRectZero];
        _more.font = [UIFont systemFontOfSize:12];
        _more.textColor = [UIColor grayColor];
        _more.text = @"更多";
        [self addSubview:_more];
        
        _arrowRight = [[UIImageView alloc]initWithFrame:CGRectZero];
        _arrowRight.image = [UIImage imageNamed:@"ArrowRight"];
        [self addSubview:_arrowRight];
        
        _line =[[UIView alloc]initWithFrame:CGRectZero];
        _line.backgroundColor = RGB3(235);
        [self addSubview:_line];
        
    }
    return self;
}

- (void)hiddenMore{
    self.more.hidden = TRUE;
    self.arrowRight.hidden = TRUE;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize ns = [self.name sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    self.name.frame = CGRectMake(10, 10, ns.width, 14);
    
    self.arrowRight.frame = CGRectMake(DEVICEWIDTH-20, 12, 10, 10);
    
    CGSize ms = [self.more sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
    self.more.frame = CGRectMake(self.arrowRight.x-5-ms.width, 11, ms.width, 12);
    
    self.line.frame = CGRectMake(0, self.name.top+10, DEVICEWIDTH, 1);
}

@end
