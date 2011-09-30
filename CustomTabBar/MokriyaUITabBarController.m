//
//  MokriyaUITabBarController.m
//  CustomTabBar
//
//  Created by Mohith K M on 9/30/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import "MokriyaUITabBarController.h"


@implementation MokriyaUITabBarController
@synthesize tabBarSelectedStateImagesArray;
@synthesize tabBarImagesArray;
@synthesize tabBarTitlesArray;

- (void)customizeTabBar
{
    [self customizeTabBarImages];
    [self customizeTabBarLabels];
    [self didSelectTab:[tabBarButtonsArray objectAtIndex:0]];
    
}

- (void)customizeTabBarImages
{
    tabBarButtonsArray = [[NSMutableArray alloc] initWithCapacity:0];
    int tabItemsCount = [self.viewControllers count];
    
    if (tabItemsCount!= [tabBarImagesArray count] || tabItemsCount != [tabBarSelectedStateImagesArray count]||tabItemsCount != [tabBarTitlesArray count]) {
        NSLog(@"tabItemsCount!= [tabBarImagesArray count] || tabItemsCount != [tabBarSelectedStateImagesArray count] ||tabItemsCount != [tabBarTitlesArray count] ");
        NSLog(@"Fix it");
        return;
    }
    
    float tabWidth = self.tabBar.frame.size.width/tabItemsCount;
    float tabHeight = self.tabBar.frame.size.height;
    float tabXCenter=tabWidth/2;
    float tabYCenter = self.tabBar.frame.size.height/2;
    for (int i=0;i < [self.viewControllers count]; i++) {
        UIButton *tabBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarButton.tag = i;
        [tabBarButton addTarget:self action:@selector(didSelectTab:) forControlEvents:UIControlEventTouchDown];
        UIImage *buttonImage = [tabBarImagesArray objectAtIndex:i];
       // UIImage *buttonSelectedStateImage = [tabBarSelectedStateImagesArray objectAtIndex:i];
        
        tabBarButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        tabBarButton.frame = CGRectMake(0.0, 0.0, tabWidth,tabHeight);
    
        
        [tabBarButton setImage:buttonImage forState:UIControlStateNormal];
        [tabBarButton setImage:buttonImage forState:UIControlStateSelected];
        [tabBarButton setImage:buttonImage forState:UIControlStateHighlighted];
        [tabBarButton setImage:buttonImage forState:UIControlStateSelected|UIControlStateHighlighted];
        
        //[tabBarButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        tabBarButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        tabBarButton.imageView.image = buttonImage;
        tabBarButton.selected = YES;
        tabBarButton.center = CGPointMake(tabXCenter, tabYCenter);
        tabXCenter += tabWidth;
        [tabBarButtonsArray addObject:tabBarButton];
        [self.tabBar addSubview:tabBarButton];
        
    }
    
    
   
}




- (void)customizeTabBarLabels
{
    
    tabBarLabelsArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    int tabItemsCount = [self.viewControllers count];
    
    if (tabItemsCount!= [tabBarImagesArray count] || tabItemsCount != [tabBarSelectedStateImagesArray count]) {
        NSLog(@"tabItemsCount!= [tabBarImagesArray count] || tabItemsCount != [tabBarSelectedStateImagesArray count]");
        
        return;
    }
    
    float tabWidth = self.tabBar.frame.size.width/tabItemsCount;
    
    float tabXCenter = tabWidth/2;
    float tabYCenter = self.tabBar.frame.size.height-7;
    
    for (int i=0;i < [self.viewControllers count]; i++) {
        UILabel *tabBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,tabWidth, 50)];
        tabBarLabel.text = [tabBarTitlesArray objectAtIndex:i];
        tabBarLabel.center = CGPointMake(tabXCenter, tabYCenter);
        tabBarLabel.backgroundColor = [UIColor clearColor];
        tabBarLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10];
        tabBarLabel.textAlignment = UITextAlignmentCenter;
        tabXCenter += tabWidth;
        [self.tabBar addSubview:tabBarLabel];
        [tabBarLabelsArray addObject:tabBarLabel];
        [tabBarLabel release];
    }
    
}

- (void)didSelectTab:(id)sender
{
    UIButton *selectedButton = (UIButton *)sender;
    self.selectedIndex = selectedButton.tag;
    
    for (int i=0; i<[tabBarButtonsArray count]; i++) {
        if (selectedButton.tag==i) {
            UILabel *tabBarLabel = [tabBarLabelsArray objectAtIndex:i];
            tabBarLabel.textColor = [UIColor whiteColor];
            
            continue;
        }
        UIImage *buttonImage = [tabBarImagesArray objectAtIndex:i];
        UIButton *button = [tabBarButtonsArray objectAtIndex:i];
        [button setImage:buttonImage forState:UIControlStateNormal];
        [button setImage:buttonImage forState:UIControlStateSelected];
        [button setImage:buttonImage forState:UIControlStateHighlighted];
        [button setImage:buttonImage forState:UIControlStateSelected|UIControlStateHighlighted];
        
        UILabel *tabBarLabel = [tabBarLabelsArray objectAtIndex:i];
        tabBarLabel.textColor = [UIColor blackColor];
    
    }
    
    UIImage *buttonImage = [tabBarSelectedStateImagesArray objectAtIndex:selectedButton.tag];
    [selectedButton setImage:buttonImage forState:UIControlStateNormal];
    [selectedButton setImage:buttonImage forState:UIControlStateSelected];
    [selectedButton setImage:buttonImage forState:UIControlStateHighlighted];
    [selectedButton setImage:buttonImage forState:UIControlStateSelected|UIControlStateHighlighted];
}

- (void)dealloc
{
    [tabBarButtonsArray release];
    [tabBarLabelsArray release];
    [super dealloc];
}

@end
