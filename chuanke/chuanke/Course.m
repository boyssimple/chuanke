//
//  Course.m
//  chuanke
//
//  Created by zhouMR on 16/7/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "Course.h"

@implementation Video

- (void)parse:(NSDictionary*)obj{
    
    self.fileUrl = [obj objectForKey:@"FileURL"];
    self.title = [obj objectForKey:@"Title"];

}

@end

@implementation CsClass

- (instancetype)init{
    self = [super init];
    if (self) {
        self.videoList = [NSMutableArray array];
    }
    return self;
}


- (void)parse:(NSDictionary*)obj{
    
    self.className = [obj objectForKey:@"ClassName"];
    self.cId = [obj objectForKey:@"CID"];
    self.vLength = [[obj objectForKey:@"VideoTimeLength"]intValue];
    [self.videoList removeAllObjects];
    NSArray *arr = [obj objectForKey:@"VideoUrl"];
    for (NSDictionary *d in arr) {
        Video *cs = [[Video alloc]init];
        [cs parse:d];
        [self.videoList addObject:cs];
    }
}
@end

@implementation CsStep

- (instancetype)init{
    self = [super init];
    if (self) {
        self.classList = [NSMutableArray array];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{

    self.stepName = [obj objectForKey:@"StepName"];
    self.stepId = [obj objectForKey:@"StepID"];
    [self.classList removeAllObjects];
    NSArray *arr = [obj objectForKey:@"ClassList"];
    for (NSDictionary *d in arr) {
        CsClass *cs = [[CsClass alloc]init];
        [cs parse:d];
        [self.classList addObject:cs];
    }
}
@end


@implementation Course
- (instancetype)init{
    self = [super init];
    if (self) {
        self.stepList = [NSMutableArray array];
    }
    return self;
}

- (void)parse:(NSDictionary*)obj{
    self.courseId = [obj objectForKey:@"CourseID"];
    self.courseName = [obj objectForKey:@"CourseName"];
    self.photoUrl = [obj objectForKey:@"PhotoURL"];
    self.brief = [obj objectForKey:@"Brief"];
    NSArray *arr = [obj objectForKey:@"StepList"];
    [self.stepList removeAllObjects];
    for (NSDictionary *d in arr) {
        CsStep *cs = [[CsStep alloc]init];
        [cs parse:d];
        [self.stepList addObject:cs];
    }
}
@end
