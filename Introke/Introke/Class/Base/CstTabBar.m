//
//  CstTabBar.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CstTabBar.h"

@interface CstTabBar()

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIButton * lastItem;
@property (nonatomic, strong) UIImageView *tabBgView;
@property (nonatomic, strong) UIButton * cameraBtn;

@end

@implementation CstTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //装载背景
        [self addSubview:self.tabBgView];
        
        //装载item
        for (int i = 0; i < self.dataList.count; i++) {
            
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            item.tag = INTItemTypeLive + i;
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:item];
            
        }
        //装载相机
        [self addSubview:self.cameraBtn];
    }
    return self;
}

- (void)clickItem:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickIndex:)]) {
        [self.delegate tabbar:self clickIndex:sender.tag];
    }
    if (sender.tag == INTItemTypeLaunch) {
        return;
    }
    
    //将上一个按钮的选中状态置为NO
    self.lastItem.selected = NO;
    
    //将正在点击的按钮状态置为YES
    sender.selected = YES;
    
    //将当前按钮设置成上一个按钮
    self.lastItem = sender;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            sender.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / self.dataList.count;
    
    for (UIView * btn in self.subviews) {
        
        if (btn.tag >= INTItemTypeLive) {
            
            btn.frame = CGRectMake((btn.tag - INTItemTypeLive) * width, 0, width, self.height);
        }
    }
    
    self.tabBgView.frame = self.frame;
    self.cameraBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5 - 20);
    
    
}


- (NSArray*)dataList{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

- (UIImageView *)tabBgView {
    
    if (!_tabBgView) {
        _tabBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBgView;
}

- (UIButton *)cameraBtn {
    
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        _cameraBtn.tag = INTItemTypeLaunch;
    }
    return _cameraBtn;
}

@end
