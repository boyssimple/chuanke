//
//  Home.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "Home.h"

@implementation Excellent

- (void)parse:(NSDictionary*)obj{
    self.photoUrl = [obj valueForKey:@"photo_url"];
    self.sid = [obj valueForKey:@"sid"];
    self.courseName = [obj valueForKey:@"course_name"];
    self.schoolName = [obj valueForKey:@"school_name"];
    self.student_number = [obj valueForKey:@"student_number"];
    self.courseId = [obj valueForKey:@"course_id"];
}


@end

@implementation Album

- (void)parse:(NSDictionary*)obj{
    self.photoUrl = [obj valueForKey:@"photo_url"];
    self.albumID = [[obj valueForKey:@"album_id"]intValue];
}

@end

@implementation Recommend


- (void)parse:(NSDictionary*)obj{
    self.sid = [obj valueForKey:@"sid"];
    self.photoUrl = [obj valueForKey:@"photo_url"];
    self.courseId = [obj valueForKey:@"course_id"];
    self.schoolName = [obj valueForKey:@"school_name"];
    self.courseName = [obj valueForKey:@"course_name"];
    self.payEndTime = [obj valueForKey:@"pay_end_time"];
    self.brief = [obj valueForKey:@"brief"];
    self.studentNumber = [[obj valueForKey:@"student_number"]intValue];
    self.pattern = [[obj valueForKey:@"pattern"]intValue];
    if (self.pattern == 0) {
        self.cost = [[obj valueForKey:@"cost"]intValue];
    }else{
        self.linkUrl = [obj valueForKey:@"link_url"];
        self.title = [obj valueForKey:@"title"];
    }
}

@end

@implementation Home

- (id)init{
    self = [super init];
    if (self) {
        self.focusDatas = [NSMutableArray array];
        self.praiseDatas = [NSMutableArray array];
        self.albumDatas = [NSMutableArray array];
        self.excellentDatas = [NSMutableArray array];
    }
    return self;
}

- (void)parse:(NSDictionary *)obj{
    [super parse: obj];
    NSDictionary *data = [obj valueForKey:@"data"];
    if (data) {
        NSArray *focus = [data objectForKey:@"focus_recommend"];
        for (NSDictionary *dic in focus) {
            Recommend *re = [[Recommend alloc]init];
            [re parse:dic];
            [self.focusDatas addObject:re];
        }
        
        NSArray *praise = [data objectForKey:@"praise_recommend"];
        for (NSDictionary *dic in praise) {
            Recommend *re = [[Recommend alloc]init];
            [re parse:dic];
            [self.praiseDatas addObject:re];
        }
        
        
        NSArray *album = [data objectForKey:@"album_recommend"];
        for (NSDictionary *dic in album) {
            Album *re = [[Album alloc]init];
            [re parse:dic];
            [self.albumDatas addObject:re];
        }
        
        NSArray *excellent = [data objectForKey:@"excellent_courses"];
        for (NSDictionary *dic in excellent) {
            Excellent *re = [[Excellent alloc]init];
            [re parse:dic];
            [self.excellentDatas addObject:re];
        }
    }
}

@end
