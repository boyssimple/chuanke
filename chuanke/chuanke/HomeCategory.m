//
//  HomeCategory.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "HomeCategory.h"

@interface HomeCategory()
@end

@implementation HomeCategory

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake((self.width-30)/2.0, 0, 30, 30)];
        self.img.image = [UIImage imageNamed:@"Home_Func_02"];
        [self addSubview:self.img];
        
        self.title  = [[UILabel alloc]initWithFrame:CGRectMake(0, self.img.top+10, self.width, 12)];
        self.title.font = [UIFont systemFontOfSize:12];
        self.title.textColor = [UIColor grayColor];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
    }
    return self;
}

@end
