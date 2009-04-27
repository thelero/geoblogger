//
//  TimeWarpViewController.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/15/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "TimeWarpViewController.h"
#import "GeobloggerAppDelegate.h"
#import "PostModel.h"
#import "TimeWarpDetailController.h"

#define ROW_HEIGHT 60

static UIImage *myImage;

@implementation TimeWarpViewController

@synthesize postModel;

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Posts";
//		self.navigationItem.leftBarButtonItem = self.editButtonItem;
		self.tableView.rowHeight = ROW_HEIGHT;
	}
	
	myImage = [[UIImage imageNamed:@"12-6AM.png"] retain];
	
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}


- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}


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

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	GeobloggerAppDelegate *geoBloggerAppDelegate = [[UIApplication sharedApplication] delegate]; 
	NSArray *pmList = [geoBloggerAppDelegate postModelList];
	return [pmList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [self tableviewCellWithReuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Set up the cell...
	[self configureCell:cell forIndexPath:indexPath];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	PostDetailViewController *postDetailViewController = [[PostDetailViewController alloc] initWithStyle:UITableViewStylePlain];
//	postDetailViewController.detailItem = nil;
	GeobloggerAppDelegate *geoBloggerAppDelegate = [[UIApplication sharedApplication] delegate]; 
	PostModel *pm =  [[geoBloggerAppDelegate postModelList] objectAtIndex:indexPath.row];

	TimeWarpDetailController *timeWarpDetailController = [[TimeWarpDetailController alloc] initWithPost:pm];
	
	[[self navigationController] pushViewController:timeWarpDetailController animated:YES];
	[timeWarpDetailController release];
}



#define TITLE_TAG 1
#define TEXT_TAG 2
#define TIME_TAG 3
#define IMAGE_TAG 4

- (UITableViewCell *)tableviewCellWithReuseIdentifier:(NSString *)identifier {
	CGRect rect;
	rect = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:rect reuseIdentifier:identifier] autorelease];
	
#define LEFT_COLUMN_OFFSET 10.0
#define LEFT_COLUMN_WIDTH 160.0
#define TITLE_ROW_OFFSET 8.0
#define TEXT_ROW_OFFSET 26.0
#define TITLE_LABEL_HEIGHT 18.0
#define TEXT_LABEL_HEIGHT 26.0
	
#define TIME_LABEL_HEIGHT 26.0
	
#define MIDDLE_COLUMN_OFFSET 170.0
#define MIDDLE_COLUMN_WIDTH 90.0
	
#define RIGHT_COLUMN_OFFSET 280.0
	
#define MAIN_FONT_SIZE 14.0
#define MIN_FONT_SIZE 10.0
	
#define TITLE_FONT_SIZE 14.0
#define TEXT_FONT_SIZE 10.0
	
#define IMAGE_SIDE 30.0
	
	/*
	 Create labels for text field
	 */
	UILabel *label;
	
	// title
	rect = CGRectMake(LEFT_COLUMN_OFFSET, TITLE_ROW_OFFSET, LEFT_COLUMN_WIDTH, TITLE_LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TITLE_TAG;
	label.font = [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE];
	label.adjustsFontSizeToFitWidth = YES;
	label.minimumFontSize = MIN_FONT_SIZE;
	label.highlightedTextColor = [UIColor whiteColor];
	[cell.contentView addSubview:label];
	[label release];
	
	// text
	rect = CGRectMake(LEFT_COLUMN_OFFSET, TEXT_ROW_OFFSET, LEFT_COLUMN_WIDTH, TEXT_LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TEXT_TAG;
	label.font = [UIFont boldSystemFontOfSize:TEXT_FONT_SIZE];
	label.minimumFontSize = MIN_FONT_SIZE;
	label.textColor = [UIColor blackColor];
	label.highlightedTextColor = [UIColor whiteColor];
	[cell.contentView addSubview:label];
	[label release];
	
	// time
	rect = CGRectMake(MIDDLE_COLUMN_OFFSET, (ROW_HEIGHT - TIME_LABEL_HEIGHT)/2.0, MIDDLE_COLUMN_WIDTH, TIME_LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TIME_TAG;
	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	label.textAlignment = UITextAlignmentRight;
	[cell.contentView addSubview:label];
	label.textColor = [UIColor blueColor];
	label.highlightedTextColor = [UIColor whiteColor];
	[label release];
	
//	// Create image view
//	rect = CGRectMake(RIGHT_COLUMN_OFFSET, (ROW_HEIGHT - IMAGE_SIDE) / 2.0, IMAGE_SIDE, IMAGE_SIDE);
//	
//	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
//	imageView.tag = IMAGE_TAG;
//	[cell.contentView addSubview:imageView];
//	[imageView release];
	
	return cell;	
} //  tableviewCellWithReuseIdentifier

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath; {
	GeobloggerAppDelegate *geoBloggerAppDelegate = [[UIApplication sharedApplication] delegate]; 
	PostModel *pm =  [[geoBloggerAppDelegate postModelList] objectAtIndex:indexPath.row];
	
	// Sets every other row to be a different color
	BOOL evenRow = NO;;
	if (indexPath.row % 2 == 0)
		evenRow = YES;
	
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGFloat colorComponents[4];
	colorComponents[0] = 0.7;
	colorComponents[1] = 0.9;
	colorComponents[2] = 1.0;
	colorComponents[3] = 1.0;
	
	CGColorRef backgroundColor = CGColorCreate(space, colorComponents);
	
	/*
	 Cache formatter.
	 */
	static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"h:mm a"];
	} // if
	
	// title
	UILabel *label;
	label = (UILabel *)[cell viewWithTag:TITLE_TAG];
	label.text = [pm title];
	if (evenRow)
		[label setBackgroundColor:[UIColor colorWithCGColor:backgroundColor]];
	
	// text
	label = (UILabel *)[cell viewWithTag:TEXT_TAG];
	label.text = [pm text];
	if (evenRow)
		[label setBackgroundColor:[UIColor colorWithCGColor:backgroundColor]];
	
	// date
	NSDate *tempDate = [pm updated_at];
	label = (UILabel *)[cell viewWithTag:TIME_TAG];
	label.text = [dateFormatter stringFromDate:tempDate];
	if ([tempDate compare:[NSDate date]] == NSOrderedDescending)
		label.textColor = [UIColor blueColor];
	else if ([tempDate compare:[NSDate date]] == NSOrderedAscending)
		label.textColor = [UIColor redColor];
	else
		label.textColor = [UIColor blackColor];
	
	if (evenRow)
		[label setBackgroundColor:[UIColor colorWithCGColor:backgroundColor]];
	
	// image
//	UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
//	imageView.image = myImage;
//
	
	if (evenRow)
		[cell.contentView setBackgroundColor:[UIColor colorWithCGColor:backgroundColor]];
	
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)dealloc {
	[myImage dealloc];
    [super dealloc];
}


@end

