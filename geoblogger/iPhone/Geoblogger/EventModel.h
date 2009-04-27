//
//  EventModel.h
//  Geoblogger
//
/* from schema.rb
 t.string   "title"
 t.text     "description"
 t.string   "location"
 t.integer  "user_id"
 t.integer  "event_id"
 t.datetime "created_at"
 t.datetime "updated_at"
 */
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EventModel : NSObject {
	NSString *title;
	NSString *text;
	NSString *location;
	int user_id;
	int event_id;
	NSDate *created_at;
	NSDate *updated_at;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *location;
@property (nonatomic) int user_id;
@property (nonatomic) int event_id;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;

@end
