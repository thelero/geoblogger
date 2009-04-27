//
//  CommentModel.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "CommentModel.h"


@implementation CommentModel

@synthesize comment_text, user_id, post_id;
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
