//
//  CellFocus.m
//  Introke
//
//  Created by zhouMR on 16/10/11.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellFocus.h"

@interface CellFocus()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbOnline;
@property (nonatomic, strong) UILabel *lbAddress;
@property (nonatomic, strong) UILabel *lbShow;
@property (nonatomic, strong) UIImageView *ivLargeImg;
@end

@implementation CellFocus

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _ivImg = [[UIImageView alloc]init];
        _ivImg.layer.cornerRadius = 20;
        _ivImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = [UIColor blackColor];
        [self.contentView addSubview:_lbName];
        
        _lbOnline = [[UILabel alloc]init];
        _lbOnline.font = [UIFont systemFontOfSize:12];
        _lbOnline.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_lbOnline];
        
        _lbAddress = [[UILabel alloc]init];
        _lbAddress.font = [UIFont systemFontOfSize:10];
        _lbAddress.textColor = [UIColor grayColor];
        [self.contentView addSubview:_lbAddress];
        
        _lbShow = [[UILabel alloc]init];
        _lbShow.font = [UIFont systemFontOfSize:10];
        _lbShow.textColor = [UIColor grayColor];
        [self.contentView addSubview:_lbShow];
        
        _ivLargeImg = [[UIImageView alloc]init];
        _ivLargeImg.layer.cornerRadius = 15;
        [self.contentView addSubview:_ivLargeImg];
    }
    return self;
}

- (void)updateData:(IntLive*)live {
    self.lbName.text = live.creator.nick;
    self.lbOnline.text = [NSString stringWithFormat:@"%zi",live.onlineUsers];
    self.lbAddress.text = live.city;
    self.lbShow.text = @"在看";
    if ([live.creator.portrait isEqualToString:@"intImg"]) {
        self.ivImg.image = [UIImage imageNamed:@"intImg"];
        self.ivLargeImg.image = [UIImage imageNamed:@"intImg"];
    }else{
        [self.ivImg downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait]];
        [self.ivLargeImg downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait]];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect r = self.ivImg.frame;
    r.origin.x = 10;
    r.origin.y = 10;
    r.size.width = 40;
    r.size.height = 40;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbName sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    r = self.lbName.frame;
    r.origin.x = self.ivImg.right + 5;
    r.origin.y = self.ivImg.top + 5;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbName.frame = r;
    
    size = [self.lbOnline sizeThatFits:CGSizeMake(MAXFLOAT, 12)];
    r = self.lbOnline.frame;
    r.origin.x = DEVICE_WIDTH - size.width - 12;
    r.origin.y = self.ivImg.top +7;
    r.size.width = size.width;
    r.size.height = 12;
    self.lbOnline.frame = r;
    
    size = [self.lbAddress sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbAddress.frame;
    r.origin.x = self.lbName.left;
    r.origin.y = self.ivImg.bottom - 10;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbAddress.frame = r;
    
    size = [self.lbShow sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    r = self.lbShow.frame;
    r.origin.x = DEVICE_WIDTH - size.width - 10;
    r.origin.y = self.ivImg.bottom - 10;
    r.size.width = size.width;
    r.size.height = 10;
    self.lbShow.frame = r;
    
    r = self.ivLargeImg.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.bottom + 10;
    r.size.width = DEVICE_WIDTH;
    r.size.height = 300 * RATIO_WIDHT320;
    self.ivLargeImg.frame = r;
}


+ (CGFloat)calHeight{
    return 60 + 300*RATIO_WIDHT320;
}
@end
