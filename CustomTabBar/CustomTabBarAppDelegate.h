//
//  CustomTabBarAppDelegate.h
//  CustomTabBar
//
//  Created by Mohith K M on 9/28/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MokriyaUITabBarController.h"

@interface CustomTabBarAppDelegate : NSObject <UIApplicationDelegate,UITabBarDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) MokriyaUITabBarController *tabBarController;

@end
