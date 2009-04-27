//
//  EventModel.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "EventModel.h"


@implementation EventModel

@synthesize title, text, location;
@synthesize user_id, event_id;
@synthesize created_at, updated_at;


- (id) init {
	if (self = [super init])
		return self;	
	return nil;
} // init

- (void)dealloc {
    [super dealloc];
} // dealloc


@end
