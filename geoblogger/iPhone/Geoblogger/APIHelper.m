//
//  TwitterHelper.m
//  Presence
//

#import "APIHelper.h"
#import "JSON.h"
#import "PostModel.h"
#import "GeobloggerAppDelegate.h"

@implementation APIHelper

NSString *apiurl = @"http://foohunt.appspot.com/api";

+ (id)fetchJSONObjectForURL:(NSURL *)url
{
    NSString *string = [[NSString alloc] initWithContentsOfURL:url];
    id value = [string JSONValue];
	[string release];
    return value;
}


+ (NSDictionary *)get:(NSString *)key
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/get/%@", apiurl, key]];
    return [self fetchJSONObjectForURL:url];
}

+ (NSArray *)getAll:(NSString *)type
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getAll/%@", apiurl, type]];
    return [self fetchJSONObjectForURL:url];
}

+ (NSArray *)getAll:(NSString *)type for:(NSString*)key
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/getAllFor/%@?key=%@", apiurl, type, key]];
    return [self fetchJSONObjectForURL:url];
}


+ (BOOL)set:(NSString *)key values:(NSDictionary *)dict
{
    NSString *query = @"?";
    for (NSString *key in dict)
    {
        query = [NSString stringWithFormat:@"%@%@=%@", query, key, [dict objectForKey: key]];
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/get/%@%@", apiurl, key, query]];
    return [[[self fetchJSONObjectForURL:url] objectForKey:@"success"] isEqual:@"true"];
}

// DEBUG
+ (NSMutableArray *)getPosts
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
	
	// DEBUG
	NSMutableArray *titleArray = [[NSMutableArray arrayWithObjects:
								   @"Biking",
								   @"Two",
								   @"Tea",
								   @"Eat",
								   @"blah",
								   @"blahx2",
								   @"blahx3", 
								   @"next screen!", nil] retain];
	NSMutableArray *textArray = [[NSMutableArray arrayWithObjects:
								  @"Biking 15km through a rural collection of villagers",
								  @"Spicy, spicy food",
								  @"Best green tea in the world! ",
								  @"Can’t sleep. Mosquitoes will eat me.",
								  @"blah",
								  @"blah blah",
								  @"blah blah blah", 
								  @"next screen!", nil] retain];
	NSMutableArray *timeArray = [[NSMutableArray arrayWithObjects:
								  [NSDate dateWithTimeIntervalSinceNow:-10000],
								  [NSDate dateWithTimeIntervalSinceNow:-8000],
								  [NSDate dateWithTimeIntervalSinceNow:-7000],
								  [NSDate dateWithTimeIntervalSinceNow:-500],
								  [NSDate dateWithTimeIntervalSinceNow:100],
								  [NSDate dateWithTimeIntervalSinceNow:3000],
								  [NSDate dateWithTimeIntervalSinceNow:50000],
								  [NSDate dateWithTimeIntervalSinceNow:300000], nil] retain];
	
	for (int i = 0; i < [titleArray count]; i++) {
		PostModel *pm = [[PostModel alloc] init];
		[pm setTitle:[titleArray objectAtIndex:i]];
		[pm setText:[textArray objectAtIndex:i]];
		[pm setUpdated_at:[timeArray objectAtIndex:i]];
		[array addObject:pm];
	} // for
	return array;
}

//+ (NSMutableArray *)getQuestsForGame:(NSString *)key withDelegate:(FollowTheFlagsAppDelegate *)del
//{
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//	NSArray *temp = [self getAll:@"Marker" for:key];
//	NSLog(@"num markers: %d", [temp count]);
//    for (NSDictionary *dict in temp)
//    {
//		NSArray *location = [dict objectForKey:@"location"];
//		double latitude = [[location objectAtIndex:0] doubleValue];
//		double longitude = [[location objectAtIndex:1] doubleValue];
//        QuestModel *qm = [[QuestModel alloc] initQuestWithDelegate:del withName:[dict objectForKey:@"name"] atLat:latitude atLng:longitude];
////        [qm setMedia:[self getMediaForMarker:[dict objectForKey:@"__key__"]]];
//        [array addObject: [qm autorelease]];
//    }
//	[array autorelease];
//    return array;
//}

//+ (NSArray *)getMediaForMarker:(NSString *)key
//{
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
//    for (NSDictionary *dict in [self getAll:@"Media" for:key])
//    {
//        // Uhhhh no media model....
//        
//        [array addObject: @"Uhhh No media Model."];
//    }
//    return array;
//}

//+ (NSArray *)getRequirementsForMarker:(NSString *)key
//{
//    NSMutableArray *array = [NSMutableArray initWithCapacity:10];
//    for (NSDictionary *dict in [self getAll:@"Requirement" for:key])
//    {
//        NSString *type = [dict objectForKey:@"__name__"];
//        Requirement *r;
//        if ([type startsWith:@"Code"])
//            r = [[CodeRequirement alloc] initWithCode:[dict objectForKey:@"code"]];
//        
//        else if ([type statsWith:@"Task"])
//            r = [[TaskRequirement alloc] initWithTaskKey:[[dict objectForKey:@"completed"] objectForKey:@"__key__"]];
//            
//        else if ([type startsWith:@"Location"])
//            r = [[LocationRequirement alloc] initWithLocation:@"location"]];
//        [array addObject: [r release]];
//    }
//    return array;
//}

+ (NSArray *)getPlayersForGame:(NSString *)key
{
    NSArray *trials = [self getAll:@"Trial" for:key];
    NSMutableArray *array = [NSMutableArray init];
    for (NSDictionary *dict in trials)
    {
        if ([((NSString *)[dict objectForKey:@"end_at"]) length] < 3)
        {
            [array addObject:[dict objectForKey:@"user"]];
        }
    }
    return array;
}




/*

+ (BOOL)updateStatus:(NSString *)status forUsername:(NSString *)username withPassword:(NSString *)password
{
    NSString *post = [NSString stringWithFormat:@"status=%@", [status stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@@twitter.com/statuses/update.json", username, password]];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    BOOL didSucceed = NO;
    NSURLResponse *response;
    NSError *error;
	// We should probably be parsing the data returned by this call, for now just check the error.
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (response && !error) {
        NSStringEncoding responseEncoding = CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)[response textEncodingName]));

        NSString *string = [[NSString alloc] initWithData:data encoding:responseEncoding];
        didSucceed = YES;
    }
    
    return didSucceed;
}

+ (NSDictionary *)fetchSearchResultsForQuery:(NSString *)query
{
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@", query]];
    
    return [self fetchJSONObjectForURL:url];
}
*/


@end
