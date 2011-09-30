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
}

@property (nonatomic, retain) NSMutableArray *tabBarImagesArray;
@property (nonatomic, retain) NSMutableArray *tabBarSelectedStateImagesArray;
@property (nonatomic, retain) NSMutableArray *tabBarTitlesArray;
- (void)customizeTabBar;
- (void)customizeTabBarImages;
- (void)customizeTabBarLabels;
- (void)didSelectTab:(id)sender;
@end
