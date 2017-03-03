//
//  INTLocationManager.m
//  Introke
//
//  Created by zhouMR on 16/10/13.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "INTLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface INTLocationManager()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation INTLocationManager

+ (INTLocationManager*)sharedManager{
    static INTLocationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[INTLocationManager alloc]init];
    });
    return manager;
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    CLLocationCoordinate2D coord = newLocation.coordinate;
    self.latitude = [[NSNumber numberWithDouble:coord.latitude]stringValue];
    self.longitude = [[NSNumber numberWithDouble:coord.longitude]stringValue];
    [manager stopUpdatingLocation];
}

- (void)getGps{
    [self.locationManager startUpdatingLocation];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100;
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"开启定位服务");
        }else{
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_locationManager requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}

@end
