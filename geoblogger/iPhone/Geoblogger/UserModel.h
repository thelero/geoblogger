//
//  UserModel.h
//  Geoblogger
//
/* from schema.rb
 t.string   "first_name"
 t.string   "last_name"
 t.integer  "facebook_id"
 t.string   "email_address"
 t.string   "gender"
 t.string   "hashed_password"
 t.string   "salt"
 t.datetime "created_at"
 t.datetime "updated_at"
 */
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserModel : NSObject {
	NSString *first_name;
	NSString *last_name;
	int facebook_id;
	NSString *email_address;
	NSString *gender;
	NSString *hashed_password;
	NSString *salt;
	NSDate *created_at;
	NSDate *updated_at;
}

@property (nonatomic, retain) NSString *first_name;
@property (nonatomic, retain) NSString *last_name;
@property (nonatomic) int facebook_id;
@property (nonatomic, retain) NSString *email_address;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *hashed_password;
@property (nonatomic, retain) NSString *salt;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;

@end
