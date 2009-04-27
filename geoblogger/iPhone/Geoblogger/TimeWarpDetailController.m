//
//  TimeWarpDetailController.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/23/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "TimeWarpDetailController.h"

#import "PostModel.h"

@implementation TimeWarpDetailController

@synthesize postModel;

- (id)initWithPost:(PostModel *)pm {
	if (self = [super init]) {
		self.postModel = pm;
    } // if
    return self;
} // init

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

#define IMAGE_TAG 1
#define TEXT_TAG 2

#define IMAGE_X_OFFSET 50
#define IMAGE_Y_OFFSET 20
#define IMAGE_SIDE 200

#define TEXT_X_OFFSET 20
#define TEXT_Y_OFFSET 200
#define TEXT_WIDTH 250
#define TEXT_HEIGHT 150

#define MAIN_FONT_SIZE 14.0
#define MIN_FONT_SIZE 10.0

#define TITLE_FONT_SIZE 14.0
#define TEXT_FONT_SIZE 16.0

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super viewDidLoad];
	self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	CGRect rect;
	
	// image
	rect = CGRectMake(IMAGE_X_OFFSET, IMAGE_Y_OFFSET, IMAGE_SIDE, IMAGE_SIDE);
		
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
	imageView.tag = IMAGE_TAG;
	UIImage *myImage = [[UIImage imageNamed:@"hoover.png"] retain];
	imageView.image = myImage;
	[[self view] addSubview:imageView];
	[imageView release];
	
	// text
	rect = CGRectMake(TEXT_X_OFFSET, TEXT_Y_OFFSET, TEXT_WIDTH, TEXT_HEIGHT);
	UILabel *label;
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TEXT_TAG;
	label.font = [UIFont boldSystemFontOfSize:TEXT_FONT_SIZE];
	label.minimumFontSize = MIN_FONT_SIZE;
	label.text = [postModel text];
	label.textColor = [UIColor blackColor];
	label.textAlignment = UITextAlignmentLeft;
	label.highlightedTextColor = [UIColor whiteColor];
	label.lineBreakMode = UILineBreakModeWordWrap;
	label.numberOfLines = 7;
	[[self view] addSubview:label];
	[label release];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[postModel release];
    [super dealloc];
}


@end
