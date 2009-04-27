//
//  GeobloggerAppDelegate.h
//  Geoblogger
//
//  Created by Ivan Lee on 4/14/09.
//  Copyright Stanford University 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TimeWarpViewController;
@class EventModel;

@interface GeobloggerAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet UITabBarController *tabBarController;
	UINavigationController *timeWarpNavController;
	TimeWarpViewController *timeWarpViewController;
	
	// Models
	NSMutableArray *postModelList;
	EventModel *currEvent;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;

@property (nonatomic, retain) UINavigationController *timeWarpNavController;
@property (nonatomic, retain) TimeWarpViewController *timeWarpViewController;

@property (nonatomic, retain) NSMutableArray *postModelList;
@property (nonatomic, retain) EventModel *currEvent;

@end

