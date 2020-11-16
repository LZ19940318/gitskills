//
//  AppDelegate.m
//  CarLite_iOS
//
//  Created by lizh on 2020/11/12.
//  Copyright © 2020 lizh. All rights reserved.
//

#import "AppDelegate.h"

#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setGoogleKey];

    return YES;
}

- (void)setGoogleKey{
    
    [GMSServices provideAPIKey:@"AIzaSyCq5Qtsp83gBINI7VGkjYtF8dug9vMXL7o"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyCq5Qtsp83gBINI7VGkjYtF8dug9vMXL7o"];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
   
    return YES;
}

// 即将被挂起
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

//  已经进入后台

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
   
    
}

//  即将回到前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

  
}

//  已经被激活
- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

// App 即将被杀死
- (void)applicationWillTerminate:(UIApplication *)application {

   
}

- (void)applicationWillTerminate{
    
}





@end
