//
//  Home.h
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "ApiObject.h"

@interface Recommend : NSObject
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *photoUrl;
@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *schoolName;
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSString *payEndTime;
@property (nonatomic, strong) NSString *brief;
@property (nonatomic, assign) int studentNumber;
@property (nonatomic, assign) int pattern; //1：link_url、title   0：cost
@property (nonatomic, assign) int cost;
@property (nonatomic, strong) NSString *linkUrl;
@property (nonatomic, strong) NSString *title;
- (void)parse:(NSDictionary*)obj;
@end

@interface Album : NSObject
@property (nonatomic, strong) NSString *photoUrl;
@property (nonatomic, assign) int albumID;
- (void)parse:(NSDictionary*)obj;
@end

@interface Excellent : NSObject
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *schoolName;
@property (nonatomic, strong) NSString *student_number;
@property (nonatomic, strong) NSString *photoUrl;
- (void)parse:(NSDictionary*)obj;
@end

@interface Home : ApiObject
@property (nonatomic, strong) NSMutableArray *focusDatas;
@property (nonatomic, strong) NSMutableArray *praiseDatas;
@property (nonatomic, strong) NSMutableArray *albumDatas;
@property (nonatomic, strong) NSMutableArray *excellentDatas;
@end
