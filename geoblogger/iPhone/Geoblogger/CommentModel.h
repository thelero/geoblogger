//
//  CommentModel.h
//  Geoblogger
//
/* from schema.rb
 t.text     "comment_text"
 t.integer  "user_id"
 t.integer  "post_id"
 t.datetime "created_at"
 t.datetime "updated_at"
 */
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CommentModel : NSObject {
	NSString *comment_text;
	int user_id;
	int post_id;
	NSDate *created_at;
	NSDate *updated_at;
}

@property (nonatomic, retain) NSString *comment_text;
@property (nonatomic) int user_id;
@property (nonatomic) int post_id;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;

@end
