//
//  Course.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "ApiObject.h"

@interface Video :NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *fileUrl;

- (void)parse:(NSDictionary*)obj;

@end

@interface CsClass : NSObject
@property (nonatomic, strong) NSString *cId;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, assign) int vLength;
@property (nonatomic, strong) NSMutableArray *videoList;
@property (nonatomic, assign) BOOL selected;

- (void)parse:(NSDictionary*)obj;
@end

@interface CsStep : NSObject
@property (nonatomic, strong) NSString *stepName;
@property (nonatomic, strong) NSString *stepId;
@property (nonatomic, strong) NSMutableArray *classList;

- (void)parse:(NSDictionary*)obj;
@end

@interface Course : NSObject

@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *photoUrl;
@property (nonatomic, strong) NSString *brief;
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSMutableArray *stepList;

- (void)parse:(NSDictionary*)obj;
@end
