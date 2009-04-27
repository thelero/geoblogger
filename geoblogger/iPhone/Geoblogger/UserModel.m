//
//  UserModel.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "UserModel.h"


@implementation UserModel

@synthesize first_name, last_name;
@synthesize facebook_id, email_address, gender;
@synthesize hashed_password, salt;
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
