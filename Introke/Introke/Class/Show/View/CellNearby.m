//
//  CellNearby.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellNearby.h"

@interface CellNearby()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbDistance;
@end

@implementation CellNearby
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_ivImg];
        
        _lbDistance = [[UILabel alloc]init];
        _lbDistance.font = [UIFont systemFontOfSize:12];
        _lbDistance.textColor = [UIColor blackColor];
        [self.contentView addSubview:_lbDistance];
    }
    return self;
}

- (void)showAnimation{
    if (self.near.isShow) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.near.show = TRUE;
    }];
}

- (void)setNear:(IntNearLive *)near{
    _near = near;
    [self.ivImg downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,near.creator.portrait] placeholder:@"default_room"];
    self.lbDistance.text = near.distance;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect r = self.ivImg.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height - 20;
    self.ivImg.frame = r;
    
    r = self.lbDistance.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.bottom;
    r.size.width = self.width;
    r.size.height = 20;
    self.lbDistance.frame = r;
}
@end
