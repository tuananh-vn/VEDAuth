//
//  VEDAuthAppDelegate.m
//  VEDAuth
//
//  Created by tuananh on 01/10/2017.
//  Copyright (c) 2017 tuananh. All rights reserved.
//

#import "VEDAuthAppDelegate.h"

#import "VEDAuth/GCVETVHelpManager.h"

@implementation VEDAuthAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    GCVETVHelpManager *floatManager = [GCVETVHelpManager sharedManager];
    floatManager.salt = @"7d5f8c171b172d2b9c6b3407bc1c810a";
    floatManager.serverURL = @"http://hotro.garena.vn/app-auth";
    floatManager.tokenID = @"76ffc3d38840204cee1b7f214e61b6d4e05761546f12aa1db0775c6820274ed2";
    floatManager.redirectURL =@"https://hotro.garena.vn/gui-yeu-cau?embedded=1";
    [floatManager showHelp];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
