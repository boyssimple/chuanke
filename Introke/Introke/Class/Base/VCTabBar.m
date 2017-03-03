//
//  VCTabBar.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCTabBar.h"
#import "CstTabBar.h"
#import "INTBaseNV.h"
#import "VCLuanch.h"

@interface VCTabBar ()<CstTabBarDelegate>
@property (nonatomic, strong) CstTabBar *cstTabBar;
@end

@implementation VCTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewControllers];
    //加载自定义tabbar
    [self.tabBar addSubview:self.cstTabBar];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];

}

- (void)tabbar:(CstTabBar *)tabbar clickIndex:(INTItemType)index{
    if (index != INTItemTypeLaunch) {
        //当前tabbar的索引
        self.selectedIndex = index - INTItemTypeLive;
        return;
    }
    //打开相机
    VCLuanch * launchVC = [[VCLuanch alloc] init];
    
    [self presentViewController:launchVC animated:YES completion:nil];
}

#pragma mark - privte methods

- (void)configViewControllers {
    
    NSMutableArray * viewControlNames = [NSMutableArray arrayWithArray:@[@"VCMain",@"VCMe"]];
    
    for (NSUInteger i = 0; i < viewControlNames.count; i ++) {
        
        NSString * controllerName = viewControlNames[i];
        
        UIViewController * vc = [[NSClassFromString(controllerName) alloc] init];
        
        INTBaseNV * nav = [[INTBaseNV alloc] initWithRootViewController:vc];
        
        [viewControlNames replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = viewControlNames;
    
}


- (CstTabBar *)cstTabBar {
    
    if (!_cstTabBar) {
        
        _cstTabBar = [[CstTabBar alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 49)];
        _cstTabBar.delegate = self;
    }
    return _cstTabBar;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
