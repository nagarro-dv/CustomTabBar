//
//  CustomTabBarAppDelegate.m
//  CustomTabBar
//
//  Created by Mohith K M on 9/28/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import "CustomTabBarAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@implementation CustomTabBarAppDelegate

@synthesize window=_window;

@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    
    tabBarController = [[MokriyaUITabBarController alloc] init];
    FirstViewController *firstView = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    ThirdViewController *thirdView = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    FourthViewController *fourthView = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
    FifthViewController *fifthView = [[FifthViewController alloc] initWithNibName:@"FifthViewController" bundle:nil];
    
    
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:firstView,secondView,thirdView,fourthView,fifthView,nil];
    
    tabBarController.tabBarImagesArray = [NSMutableArray arrayWithObjects:
                                          [UIImage imageNamed:@"m1.png"],
                                          [UIImage imageNamed:@"m2.png"],
                                          [UIImage imageNamed:@"m3.png"],
                                          [UIImage imageNamed:@"m4.png"],
                                          [UIImage imageNamed:@"m5.png"],
                                          nil];
                        
    tabBarController.tabBarSelectedStateImagesArray = [NSMutableArray arrayWithObjects:
                                          [UIImage imageNamed:@"am1.png"],
                                          [UIImage imageNamed:@"am2.png"],
                                          [UIImage imageNamed:@"am3.png"],
                                          [UIImage imageNamed:@"am4.png"],
                                          [UIImage imageNamed:@"am5.png"],
                                          nil];
    tabBarController.tabBarTitlesArray = [NSMutableArray arrayWithObjects:
                                          @"Home",
                                          @"About Us",
                                          @"Services",
                                          @"Portfolio",
                                          @"Contact Us",
                                          nil];
    
    [firstView release];
    [secondView release];
    [thirdView release];
    [fourthView release];
    [fifthView release];
    [tabBarController customizeTabBar];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [tabBarController release];
    [super dealloc];
}

@end
