//
//  AppDelegate.m
//  RESideMenu
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 yrh.com. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"

#import "ViewController.h"
#import "BackViewController.h"
@interface AppDelegate ()
@property (nonatomic, strong) RESideMenu * sideMenuViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ViewController * rootVC =[[ViewController alloc] init];
    BackViewController * left = [[BackViewController alloc] init];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber =
    [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    //UIViewController *leftMenuController = [[UIViewController alloc] init];
    UIViewController *rightMenuController = [[UIViewController alloc] init];
    self.sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController leftMenuViewController:left rightMenuViewController:rightMenuController];
    _sideMenuViewController.backgroundImage = [UIImage imageNamed:@"e.png"];
    self.window.rootViewController = _sideMenuViewController;
     rootVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(event:)];
    
//    [self.sideMenuViewController presentLeftMenuViewController];
//    [self.sideMenuViewController presentRightMenuViewController];
    
    
    // 若所有界面都加入了侧滑功能可用下列方法解决
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(disableRESideMenu) name:@"disableRESideMenu" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableRESideMenu) name:@"enableRESideMenu" object:nil];
    
    return YES;
}
- (void)event:(UIButton *)sender{
    
    [self.sideMenuViewController presentLeftMenuViewController];
}
/*
- (void)enableRESideMenu {
    self.sideMenuViewController.panGestureEnabled = YES;
}
- (void)disableRESideMenu {
    self.sideMenuViewController.panGestureEnabled = NO;
}
*/

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
