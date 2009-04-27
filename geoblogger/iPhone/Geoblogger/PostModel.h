//
//  PostModel.h
//  Geoblogger
//
//  Created by Ivan Lee on 4/21/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject {
	NSMutableArray *titleArray, *textArray;
	NSMutableArray *timeArray;
	
	NSString *title;
	NSString *text;
	NSString *location;
	float latitude;
	float longitude;
	int user_id;
	int event_id;
	NSDate *created_at;
	NSDate *updated_at;
}

@property (nonatomic, retain) NSMutableArray *titleArray;
@property (nonatomic, retain) NSMutableArray *textArray;
@property (nonatomic, retain) NSMutableArray *timeArray;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *location;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) int user_id;
@property (nonatomic) int event_id;
@property (nonatomic, retain) NSDate *created_at;
@property (nonatomic, retain) NSDate *updated_at;

@end
