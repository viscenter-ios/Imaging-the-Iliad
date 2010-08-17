//
//  IliadAppDelegate.m
//  Iliad
//
//  Created by Vis Center on 7/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "IliadAppDelegate.h"
#import "BaseViewController.h"
#import "IliadViewController.h"

@implementation IliadAppDelegate

@synthesize window;

@synthesize bookmarksArray;
@synthesize bookmarksNotesArray, indexClicked, bookmarksArrayOneSaved;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	UIViewController *rootViewController = [[[BaseViewController alloc] init] autorelease];
    viewController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	
	// Override point for customization after application launch.
	[window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	
	bookmarksArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"bookmarksArray"] mutableCopy];
	if (bookmarksArray == NULL) {
	bookmarksArray = [[NSMutableArray arrayWithObjects: nil] retain];
	}
	
	
	bookmarksNotesArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"bookmarksNotesArray"] mutableCopy];
	if (bookmarksNotesArray == NULL) {
	bookmarksNotesArray = [[NSMutableArray arrayWithObjects: nil] retain];
	}
	
	bookmarksArrayOneSaved = [[[NSUserDefaults standardUserDefaults] objectForKey:@"bookmarksArrayOneSaved"] mutableCopy];
	if (bookmarksArrayOneSaved == NULL) {
		bookmarksArrayOneSaved = [[NSMutableArray arrayWithObjects: nil] retain];
	}
	
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	
	//[IliadViewController saveStuff];
	    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
	

	
	NSLog(@"save stuff");
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"saveStuff"
														object:nil
													  userInfo:nil];
	
	
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject:bookmarksArray forKey:@"bookmarksArray"];
	[defaults setObject:bookmarksNotesArray forKey:@"bookmarksNotesArray"];
	[defaults setObject:bookmarksArrayOneSaved forKey:@"bookmarksArrayOneSaved"];

	
	[prefs synchronize];
	
	
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
