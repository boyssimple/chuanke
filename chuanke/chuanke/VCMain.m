//
//  VCMain.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMain.h"
#import "VCHome.h"
#import "VCCategory.h"
#import "VCMine.h"
#import "VCOffLine.h"
#import "NavViewController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface VCMain ()<UITabBarControllerDelegate>

@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.delegate = self;
    [self createContentPages];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (tabBarController.selectedIndex >= 2){
//        viewController.navigationController.navigationBarHidden = TRUE;
//    }else{
//        viewController.navigationController.navigationBarHidden = FALSE;
//    }
}

- (void) createContentPages {
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"VCHome",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"tab_home",
                                   kSelImgKey : @"tab_home"},
                                 
                                 @{kClassKey  : @"VCCategory",
                                   kTitleKey  : @"分类",
                                   kImgKey    : @"tab_category",
                                   kSelImgKey : @"tab_category"},
                                 
                                 @{kClassKey  : @"VCMine",
                                   kTitleKey  : @"我的课程",
                                   kImgKey    : @"tab_course",
                                   kSelImgKey : @"tab_course"},
                                 
                                 @{kClassKey  : @"VCOffLine",
                                   kTitleKey  : @"离线中心",
                                   kImgKey    : @"tab_down",
                                   kSelImgKey : @"tab_down"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        NavViewController *nav = [[NavViewController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [UIImage imageNamed:dict[kSelImgKey]];
        //        [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}


@end
