//
//  GeobloggerAppDelegate.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/14/09.
//  Copyright Stanford University 2009. All rights reserved.
//

#import "GeobloggerAppDelegate.h"
#import "APIHelper.h"

#import "PostModel.h"
#import "EventModel.h"

#import "TimeWarpViewController.h"

@implementation GeobloggerAppDelegate

@synthesize window, tabBarController, timeWarpNavController, timeWarpViewController;
@synthesize postModelList;
@synthesize currEvent;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	// Initialize modelss------------------------------------------------------------------------------------------
	postModelList = [[NSMutableArray alloc] init];
	currEvent = nil;
	
	// Populate list of posts--------------------------------------------------------------------------------------
	NSArray *getPostModels = [APIHelper getPosts];
	for (PostModel *pm in getPostModels) {
		[postModelList addObject:pm];
	} // for
	
	// Set up controllerss-----------------------------------------------------------------------------------------
	TimeWarpViewController *tempTimeWarpViewController = [[TimeWarpViewController alloc] initWithStyle:UITableViewStylePlain];
	[self setTimeWarpViewController:tempTimeWarpViewController];
	[tempTimeWarpViewController release];
	
	// Set navigation controllers for table viewss-----------------------------------------------------------------
	UINavigationController *tempNav = [[UINavigationController alloc] init];
	[tempNav pushViewController:timeWarpViewController animated:YES];
	[self setTimeWarpNavController:tempNav];
	[tempNav release];
	
	// Setting view (within tab bar)s------------------------------------------------------------------------------
	UIViewController *tabTimeWarpViewController = [[tabBarController viewControllers] objectAtIndex:0];
	[tabTimeWarpViewController setView:[timeWarpNavController view]];
	
	[window addSubview:[tabBarController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[timeWarpNavController release];
	[timeWarpViewController release];
	[postModelList release];
	[window release];
    [super dealloc];
}


@end
