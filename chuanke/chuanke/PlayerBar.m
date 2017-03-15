//
//  PlayerBar.m
//  chuanke
//
//  Created by zhouMR on 16/7/20.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "PlayerBar.h"
#import "BarButton.h"

@implementation PlayerBar


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _vLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 1)];
        _vLine.backgroundColor = RGB3(235);
        [self addSubview:_vLine];
        
        CGFloat m = 15;
        for (int i =0; i< 4; i++) {
            BarButton * bar = [[BarButton alloc]initWithFrame:CGRectMake((i*2+1)*m+i*25, 5, 25, 50)];
            [self addSubview:bar];
            if (i == 0) {
                bar.ivIcon.image = [UIImage imageNamed:@"player_download"];
                bar.lbText.text = @"下载";
            }else if(i == 1){
                bar.ivIcon.image = [UIImage imageNamed:@"player_save"];
                bar.lbText.text = @"收藏";
            }else if(i == 2){
                bar.ivIcon.image = [UIImage imageNamed:@"player_share"];
                bar.lbText.text = @"分享";
            }else if(i == 3){
                bar.ivIcon.image = [UIImage imageNamed:@"player_ask"];
                bar.lbText.text = @"咨询";
            }
        }
        CGFloat w = DEVICEWIDTH - (15*8+25*4);
        _btnJoin = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH-w, 0, w, self.height)];
        [_btnJoin setTitle:@"参加该课程" forState:UIControlStateNormal];
        [_btnJoin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnJoin.titleLabel.font = [UIFont systemFontOfSize:14];
        _btnJoin.backgroundColor = APPCOLOR;
        [self addSubview:_btnJoin];
    }
    return self;
}

@end
