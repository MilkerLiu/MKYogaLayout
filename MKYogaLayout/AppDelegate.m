//
//  AppDelegate.m
//  MKYogaLayout
//
//  Created by Milker on 2018/5/25.
//  Copyright © 2018年 Milker. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MKYoga.h"

@interface AppDelegate () <MKYogaDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    UINavigationController *nav = [[UINavigationController alloc] init];
    [nav setViewControllers:@[[ViewController new]]];
    nav.view.backgroundColor = [UIColor whiteColor];

    [self.window setRootViewController:nav];

    [[MKYoga shareInstance] setDelegate:self];

    return YES;
}

- (void)mkYogaNetworkImageLoader:(UIView *)view value:(NSString *)value style:(NSDictionary *)style {

}

- (void)mkYogaRouterEvent:(UIView *)view value:(NSURL *)value {

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
