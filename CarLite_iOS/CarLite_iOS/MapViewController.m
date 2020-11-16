//
//  MapViewController.m
//  CarLite_iOS
//
//  Created by lizh on 2020/11/12.
//  Copyright © 2020 lizh. All rights reserved.
//

#import "MapViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController ()<CLLocationManagerDelegate>

// 地图
@property (nonatomic, strong) GMSMapView *mapView;

// 定位
@property (nonatomic, strong) CLLocationManager *locationManager;;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMap];
    /**判断 是否开启定位模式*/
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
       /**创建一个location管理器*/
     
       /**发送请求*/
       [self.locationManager requestLocation];
    }else{
       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tips" message:@"Please go to system settings to modify the positioning function of Spacebib" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
       [alertView show];
    }
    
    // Do any additional setup after loading the view.
}


- (void)createMap{
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:103
                                                            longitude:1.6921
                                                                  zoom:25];
    self.mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0,ScreenW, ScreenH ) camera:nil];
    [self.view addSubview: self.mapView];
    self.mapView.myLocationEnabled = YES;
    self.mapView.indoorEnabled = NO;
    self.mapView.mapType = kGMSTypeTerrain;
    self.mapView.settings.myLocationButton = YES;

}


/**返回定位信息*/
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    /**停止更新定位信息*/
    [self.locationManager stopUpdatingLocation];
    CLLocation *location;
    if (locations.count >= 1) {
        location = [locations firstObject];
         CLLocationCoordinate2D star = CLLocationCoordinate2DMake(location.coordinate.latitude + 1, location.coordinate.longitude + 1);
        for (int i = 0; i < 10; i++) {
            
            CLLocationCoordinate2D star = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude );
//            // 地图添加点
//            GMSMarker *starMarker = [GMSMarker markerWithPosition:star];
//            starMarker.title = @"开始";
//            starMarker.icon = [UIImage imageNamed:@"TrackerMapStar"];
//            starMarker.map = self.mapView;
//
//

            self.mapView.camera = [GMSCameraPosition cameraWithTarget:star zoom:13];

            
            // test data
            NSArray * latArr = @[@(star.latitude +0.004),@(star.latitude +0.008),@(star.latitude +0.007),@(star.latitude -0.0022),@(star.latitude -0.004)];

            NSArray * lngArr = @[@(star.longitude+0.007),@(star.longitude+0.001),@(star.longitude+0.003),@(star.longitude+0.003),@(star.longitude-0.008)];

            
            
            for(int i =0;i < latArr.count; i++){

                GMSMarker*sydneyMarker = [[GMSMarker alloc]init];

                sydneyMarker.title=@"Sydney!";

                sydneyMarker.icon= [UIImage imageNamed:@"TrackerMapStar"];

                sydneyMarker.position=CLLocationCoordinate2DMake([latArr[i]doubleValue], [lngArr[i]doubleValue]);

                sydneyMarker.map=self.mapView;

            }
            
            
        }
        
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
        
        _locationManager.allowsBackgroundLocationUpdates = NO;
          /**当当前系统版本大于8.0的时候，执行以下方法*/
        if ([UIDevice currentDevice].systemVersion.floatValue >8.0) {
              /**ios8新加的，当使用的时候获取地理位置*/
            [_locationManager requestAlwaysAuthorization];
        }
    }
    
    return _locationManager;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
