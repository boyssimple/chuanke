//
//  INTMacros.h
//  Introke
//
//  Created by zhouMR on 16/10/10.
//  Copyright © 2016年 luowei. All rights reserved.
//

#ifndef INTMacros_h
#define INTMacros_h

#define DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height

# define RATIO_WIDHT320 [UIScreen mainScreen].bounds.size.width/320.0
# define RATIO_HEIGHT568 [UIScreen mainScreen].bounds.size.height/568.0

#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1)
#define RGB3(r) RGBA(r,r,r,1)

#define TAB_NAV_STATUS 64+49

#endif /* INTMacros_h */
