//
//  INTAdvitise.h
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic, strong) NSString * action;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, assign) NSInteger position;
- (void)parse:(NSDictionary*)obj;
@end

@interface INTAdvitise : NSObject
@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, strong) NSString * md5;
@property (nonatomic, strong) NSMutableArray * resources;
- (void)parse:(NSDictionary*)obj;
@end
