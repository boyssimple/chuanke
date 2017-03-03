//
//  INTMainNavView.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTMainNavView.h"
@interface INTMainNavView()
@property (nonatomic, strong) UIView *lineView;
@end
@implementation INTMainNavView

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray*)titles{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.width / titles.count;
        CGFloat height = self.height;
        for (NSInteger i = 0; i < titles.count; i++) {
            NSString *title = titles[i];
            UIButton *titleBar = [UIButton buttonWithType:UIButtonTypeCustom];
            [titleBar setTitle:title forState:UIControlStateNormal];
            [titleBar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBar.frame = CGRectMake(i * width, 0, width, height);
            titleBar.titleLabel.font = [UIFont systemFontOfSize:14];
            titleBar.tag = 100+i;
            [titleBar addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBar];
            
            if (i == 1) {
                CGFloat h = 2;
                CGFloat y = 40;
                [titleBar.titleLabel sizeToFit];
                self.lineView = [[UIView alloc]init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.frame = CGRectMake(0, y, titleBar.titleLabel.width, h);
                self.lineView.centerX = titleBar.centerX;
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}

- (void)titleClick:(UIButton*)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = sender.centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(navBarTitleClick:)]) {
        [self.delegate navBarTitleClick:sender.tag-100];
    }
}


- (void)selectIndex:(NSInteger)index{
    UIButton *sender = [self viewWithTag:index+100];
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.centerX = sender.centerX;
    }];
}

@end
