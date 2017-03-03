//
//  INTAdvitiseView.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTAdvitiseView.h"
#import "IntMainHandler.h"
#import "INTAdvitise.h"
#import "UIImageView+SDWebImage.h"
#import "INTCacheHelper.h"

static NSUInteger showTime = 3;
@interface INTAdvitiseView()
@property (nonatomic, strong) UIImageView *ivBackBg;
@property (nonatomic, strong) UILabel *lbSecond;
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation INTAdvitiseView

- (instancetype)init{
    self = [super init];
    if(self){
        [self initUI];
        //展示广告
        [self showAd];
        //下载广告
        [self downAd];
        //倒计时
        [self startTimer];
    }
    return self;
}

- (void)initUI{
    self.frame = [UIScreen mainScreen].bounds;
    _ivBackBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:_ivBackBg];
    
    _lbSecond = [[UILabel alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-60, 20, 50, 20)];
    _lbSecond.font = [UIFont systemFontOfSize:14];
    _lbSecond.textColor = [UIColor whiteColor];
    _lbSecond.textAlignment = NSTextAlignmentCenter;
    _lbSecond.backgroundColor = [UIColor grayColor];
    [self addSubview:_lbSecond];
}

- (void)showAd{
    NSString *fileName = [INTCacheHelper getAdImage];
    NSString *filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,fileName];
    
    UIImage *lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (lastCacheImage) {
        self.ivBackBg.image = lastCacheImage;
    }else{
        self.hidden = YES;
    }
}

- (void)downAd{
    [IntMainHandler excuteAdvitiseWithSuccess:^(id json) {
        INTAdvitise *ads = json;
        Resource *res = [ads.resources objectAtIndex:0];
        NSString *imgUrl = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,res.image];
        NSURL *url = [NSURL URLWithString:imgUrl];
        [[SDWebImageManager sharedManager]downloadImageWithURL:url options:SDWebImageAvoidAutoSetImage progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            [INTCacheHelper setAdImage:res.image];
            NSLog(@"下载成功");
        }];
        
    } withFail:^(id error) {
        
    }];
}

- (void)startTimer{
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.lbSecond.text = [NSString stringWithFormat:@"跳过%zd",timeout];
            });
        }
        timeout--;
    });
    dispatch_resume(timer);
}

- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
