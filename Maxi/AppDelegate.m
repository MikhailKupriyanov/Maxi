//
//  AppDelegate.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "AppDelegate.h"

// Common
#import "Common.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    application.statusBarStyle = UIStatusBarStyleLightContent;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = maxiBackgroundColor;
    [UINavigationBar appearance].titleTextAttributes = @{
        NSForegroundColorAttributeName : [UIColor whiteColor]
    };
    
    [UINavigationBar appearance].shadowImage = [UIImage new];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
