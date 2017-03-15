//
//  ApiObject.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiObject : NSObject
@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSString *desc;

- (void)parse:(NSDictionary*)obj;
@end
