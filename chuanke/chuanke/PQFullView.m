//
//  PQFullView.m
//  PentaQMovie
//
//  Created by zhouMR on 16/3/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "PQFullView.h"

@implementation PQFullView

- (id)init
{
    self = [super initWithFrame:(CGRect) {{0.f,0.f}, [[UIScreen mainScreen] bounds].size}];
    if (self) {
        [self initBase];
    }
    
    return self;
}


-(void)initBase{
    self.windowLevel = UIWindowLevelAlert;
    pQFullViewWindow = self;
    self.view = [[UIView alloc] initWithFrame:self.frame];
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self addSubview:self.view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)show {
    [self makeKeyAndVisible];
    [UIView animateWithDuration:0.3 animations:^{
        pQFullViewWindow.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss {

    [UIView animateWithDuration:0.3 animations:^{
        pQFullViewWindow.alpha = 0;
    } completion:^(BOOL finished) {
        pQFullViewWindow.hidden = true;
        pQFullViewWindow = nil;
        [self resignKeyWindow];
    }];
}

@end
