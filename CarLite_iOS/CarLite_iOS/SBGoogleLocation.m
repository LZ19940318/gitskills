//
//  SBGoogleLocation.m
//  Spacebib
//
//  Created by lizh on 2020/5/28.
//  Copyright © 2020 Spacebib. All rights reserved.
//

#import "SBGoogleLocation.h"

#import <CoreMotion/CoreMotion.h>


static SBGoogleLocation *location = nil;

@interface SBGoogleLocation()

@property (nonatomic, strong) CMMotionManager *locationManager;

@property (nonatomic, strong) SBGoogleLocation *location;

@end

@implementation SBGoogleLocation

+ (SBGoogleLocation *)shared{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    
        location = [[SBGoogleLocation alloc] init];
    });
    
    return location;
}

- (void)startLocationCompletion:(locationCompletion)completion{
    
    self.completion = completion;
       /**判断 是否开启定位模式*/
        if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
            /**创建一个location管理器*/
          
            /**发送请求*/
            [self.locationManager requestLocation];
        }else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tips" message:@"Please go to system settings to modify the positioning function of Spacebib" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
            [alertView show];
        }
}

/**返回定位信息*/
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    /**停止更新定位信息*/
    [self.locationManager stopUpdatingLocation];
    CLLocation *location;
    if (locations.count >= 1) {
        location = [locations firstObject];
        self.completion(location,@"");
    }
}

/**返回错误信息*/
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];

          /**设置代理，实现定位成功或失败后执行相应地方法*/
        _locationManager.delegate = self;

          /**设置定位精度，有好几个等级，如果对精确度要求不是太高，可以设置10米或百米*/
        _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;

          /**设置距离过滤,当我超出上次定位多少米之后才重新定位*/
        _locationManager.distanceFilter = 10;

        _locationManager.pausesLocationUpdatesAutomatically = NO;
        
        _locationManager.allowsBackgroundLocationUpdates = YES;
          /**当当前系统版本大于8.0的时候，执行以下方法*/
        if ([UIDevice currentDevice].systemVersion.floatValue >8.0) {
              /**ios8新加的，当使用的时候获取地理位置*/
            [_locationManager requestAlwaysAuthorization];
        }
    }
    
    return _locationManager;
}


@end
