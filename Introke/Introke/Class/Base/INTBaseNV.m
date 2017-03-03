//
//  INTBaseNV.m
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTBaseNV.h"

@interface INTBaseNV ()

@end

@implementation INTBaseNV

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = RGB(0, 216, 201);
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = TRUE;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
