//
//  TwitterHelper.h
//  Presence
//

#import <UIKit/UIKit.h>

// For more on the Twitter API: http://apiwiki.twitter.com/REST+API+Documentation
// For more on json-framework: http://code.google.com/p/json-framework

@class FollowTheFlagsAppDelegate;

@interface APIHelper : NSObject {
	
}

+ (NSDictionary *)get:(NSString *)key;
+ (NSArray *)getAll:(NSString *)type;
+ (NSArray *)getAll:(NSString *)type for:(NSString*)key;

//+ (BOOL)set:(NSString *)key values:(NSDictionar

+ (NSMutableArray *)getPosts;
//+ (NSMutableArray *)getQuestsForGame:(NSString *)key withDelegate:(FollowTheFlagsAppDelegate *)del;
//
//+ (NSArray *)getMediaForMarker:(NSString *)key;
//+ (NSArray *)getRequirementsForMarker:(NSString *)key;
//
//+ (NSArray *)getPlayersForGame:(NSString *)key;



@end
