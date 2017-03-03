//
//  VCLuanch.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCLuanch.h"
#import "LFLivePreview.h"

@interface VCLuanch ()
@property (nonatomic, strong) UIButton *btnLocImg;
@property (nonatomic, strong) UIButton *btnLocation;
@property (nonatomic, strong) UIImageView *ivBg;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UITextField *tfTitle;
@property (nonatomic, strong) UIButton *btnStart;
@end

@implementation VCLuanch

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ivBg];
    [self.view addSubview:self.btnLocImg];
    [self.view addSubview:self.btnLocation];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.tfTitle];
    [self.view addSubview:self.btnStart];
}

- (void)clickBack:(UIButton*)sender{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void)startAction:(UIButton*)sender{
    LFLivePreview *livePreview = [[LFLivePreview alloc]initWithFrame:self.view.bounds];
    [livePreview startLive];
    livePreview.vc = self;
    [self.view addSubview:livePreview];
}

- (UIButton *)btnLocImg{
    if (!_btnLocImg) {
        _btnLocImg = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 27, 27)];
        [_btnLocImg setImage:[UIImage imageNamed:@"launch_map_on"] forState:UIControlStateNormal];
    }
    return _btnLocImg;
}

- (UIButton *)btnLocation{
    if (!_btnLocation) {
        _btnLocation = [[UIButton alloc]initWithFrame:CGRectMake(37, 23, 50, 20)];
        [_btnLocation setTitle:@"北京" forState:UIControlStateNormal];
    }
    return _btnLocation;
}

- (UIImageView *)ivBg{
    if (!_ivBg) {
        _ivBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        _ivBg.image = [UIImage imageNamed:@"bg_zbfx"];
    }
    return _ivBg;
}

- (UIButton*)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-74, 10, 64, 64)];
        [_backBtn setImage:[UIImage imageNamed:@"launch_close"] forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UITextField*)tfTitle{
    if (!_tfTitle) {
        _tfTitle = [[UITextField alloc]initWithFrame:CGRectMake((DEVICE_WIDTH-200)/2.0, 200, 200, 25)];
        _tfTitle.textColor = [UIColor whiteColor];
        _tfTitle.placeholder = @"输入一个标题吧";
    }
    return _tfTitle;
}

- (UIButton*)btnStart{
    if (!_btnStart) {
        _btnStart = [[UIButton alloc]initWithFrame:CGRectMake((DEVICE_WIDTH-200)/2.0, self.tfTitle.bottom+30, 200, 30)];
        [_btnStart setTitle:@"开始直播" forState:UIControlStateNormal];
        [_btnStart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnStart.layer.borderColor = [UIColor whiteColor].CGColor;
        _btnStart.layer.borderWidth = 1.0;
        _btnStart.layer.cornerRadius = 15;
        [_btnStart addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnStart;
}
@end
