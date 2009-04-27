//
//  PostModel.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "PostModel.h"

@implementation PostModel

@synthesize titleArray, textArray, timeArray;

@synthesize title, text, location;
@synthesize latitude, longitude;
@synthesize user_id, event_id;
@synthesize created_at, updated_at;

- (id) init {
	if (self = [super init])
		return self;	
	return nil;
} // init

- (void)dealloc {
	[titleArray release];
	[textArray release];
	[timeArray release];
    [super dealloc];
} // dealloc

@end
