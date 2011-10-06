//
//  MokriyaUITabBarController.h
//  CustomTabBar
//
//  Created by Mohith K M on 9/30/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MokriyaUITabBarController : UITabBarController {
    @private
    NSMutableArray *tabBarButtonsArray;
    NSMutableArray *tabBarLabelsArray;
    
    NSMutableArray *allViewControllers; 
    //Array of all controllers [Case where you need to switch b'wn multiple view controllers]
}

@property (nonatomic, retain) NSMutableArray *tabBarImagesArray;
@property (nonatomic, retain) NSMutableArray *tabBarSelectedStateImagesArray;
@property (nonatomic, retain) NSMutableArray *tabBarTitlesArray;
@property (nonatomic, retain) NSMutableArray *allViewControllers;

- (void)customizeTabBar;
- (void)customizeTabBarImages;
- (void)customizeTabBarLabels;
- (void)didSelectTab:(id)sender;
- (void)didselectTabAtIndex:(NSUInteger)selectedTabIndex;
- (void)updateTabBarItemImageAndTitleAtIndex:(NSUInteger)tabIndex 
                                   withImage:(UIImage *)tabBarImage 
                       andSelectedStateImage:(UIImage *)tabBarSelectedImage
                                   withTitle:(NSString *)title;
- (void)updateTabBarItemImageAndTitleAndReplaceViewControllerAtIndex:(NSUInteger)tabIndex 
                                                           withImage:(UIImage *)tabBarImage 
                                               andSelectedStateImage:(UIImage *)tabBarSelectedImage
                                                           withTitle:(NSString *)title
                                             withViewControllerIndex:(NSUInteger)viewControllerIndex;
@end
