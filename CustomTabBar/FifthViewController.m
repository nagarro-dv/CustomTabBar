//
//  FifthViewController.m
//  CustomTabBar
//
//  Created by Mohith K M on 9/29/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import "FifthViewController.h"
#import "MokriyaUITabBarController.h"
#import "CustomTabBarAppDelegate.h"

@implementation FifthViewController
@synthesize webView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURL *url = [NSURL URLWithString:@"http://www.mokriya.com/contactus.php"];
    //http://www.mokriya.com/aboutus.html
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    NSLog(@"WebView: %@", self.webView);
    [self.webView loadRequest:requestObj];
}

-(void)webViewDidStartLoad:(UIWebView *) portal
{
}

- (void)webViewDidFinishLoad:(UIWebView *)portal{
    
} 
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	NSString *msg=@"Please try again after some time";
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Request failed" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
	[alert show];	
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        return YES;
	}
	return YES;
}

- (IBAction)changeTabBarImage:(id)sender
{
     CustomTabBarAppDelegate *appDelegate = (CustomTabBarAppDelegate *)[[UIApplication sharedApplication] delegate];

    [appDelegate.tabBarController updateTabBarItemImageAndTitleAtIndex:0
                                                             withImage:[UIImage imageNamed:@"m6.png"]
                                                 andSelectedStateImage:[UIImage imageNamed:@"am6.png"]
                                                             withTitle:@"Blog"];
    
    
}

@end
