//
//  PQPlayer.h
//  PentaQMovie
//
//  Created by zhouMR on 16/3/8.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PQFullViewController.h"
#import "PQFullView.h"

@interface PQPlayer : UIView{
    BOOL isPlay;
    id playbackObserver;
    PQFullView *fullView;
}
+ (instancetype)videoPlayView;
-(void)playWith:(NSURL*)videoUrl;

@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UIImageView *playerView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (weak, nonatomic) IBOutlet UILabel *timeStr;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIView *blackBg;

@property(nonatomic, strong) UIViewController *container;
/* 全屏控制器 */
@property (nonatomic, strong) PQFullViewController *fullVc;


//player
@property(nonatomic, strong) AVPlayerItem *playerItem;
@property(nonatomic, strong) AVPlayer *player;
@property(nonatomic, strong) AVPlayerLayer *playerLayer;

@property(nonatomic, assign) BOOL toolBarShow;//控制栏是否显示

- (IBAction)playAction:(UIButton*)sender;
- (IBAction)fullAction:(UIButton*)sender;
- (IBAction)sliderValueChange:(id)sender;
- (void)remove;
@end
