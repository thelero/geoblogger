//
//  TimeWarpViewController.m
//  Geoblogger
//
//  Created by Ivan Lee on 4/15/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import "timeWarpViewController.h"
#import "GeobloggerAppDelegate.h"
#import "PostModel.h"
#import "PostDetailViewController.h"

#define ROW_HEIGHT 60

static UIImage *myImage;

@implementation timeWarpViewController

- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		self.title = @"Geoblogs";
		self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
	PostModel *pm =  [geoBloggerAppDelegate postModel];
	return [[pm contentArray] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [self tableviewCellWithReuseIdentifier:CellIdentifier];
        //cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	[self configureCell:cell forIndexPath:indexPath];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PostDetailViewController *postDetailViewController = [[PostDetailViewController alloc] initWithStyle:UITableViewStylePlain];
	postDetailViewController.detailItem = nil;
	
	[[self navigationController] pushViewController:postDetailViewController animated:YES];
	[postDetailViewController release];
}



#define NAME_TAG 1
#define TIME_TAG 2
#define IMAGE_TAG 3

- (UITableViewCell *)tableviewCellWithReuseIdentifier:(NSString *)identifier {
	CGRect rect;
	rect = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:rect reuseIdentifier:identifier] autorelease];
	
#define LEFT_COLUMN_OFFSET 10.0
#define LEFT_COLUMN_WIDTH 160.0
	
#define MIDDLE_COLUMN_OFFSET 170.0
#define MIDDLE_COLUMN_WIDTH 90.0
	
#define RIGHT_COLUMN_OFFSET 280.0
	
#define MAIN_FONT_SIZE 14.0
#define MIN_FONT_SIZE 14.0
#define LABEL_HEIGHT 26.0
	
#define IMAGE_SIDE 30.0
	
	/*
	 Create labels for text field
	 */
	UILabel *label;
	
	rect = CGRectMake(LEFT_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT)/2.0, LEFT_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = NAME_TAG;
	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	label.adjustsFontSizeToFitWidth = YES;
	label.minimumFontSize = MIN_FONT_SIZE;
	[cell.contentView addSubview:label];
	label.highlightedTextColor = [UIColor whiteColor];
	[label release];
	
	rect = CGRectMake(MIDDLE_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT)/2.0, MIDDLE_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TIME_TAG;
	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	label.textAlignment = UITextAlignmentRight;
	[cell.contentView addSubview:label];
	label.textColor = [UIColor blueColor];
	label.highlightedTextColor = [UIColor whiteColor];
	[label release];
	
	// Create image view
	rect = CGRectMake(RIGHT_COLUMN_OFFSET, (ROW_HEIGHT - IMAGE_SIDE) / 2.0, IMAGE_SIDE, IMAGE_SIDE);
	
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
	imageView.tag = IMAGE_TAG;
	[cell.contentView addSubview:imageView];
	[imageView release];
	
	return cell;	
} //  tableviewCellWithReuseIdentifier

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath; {
	GeobloggerAppDelegate *geoBloggerAppDelegate = [[UIApplication sharedApplication] delegate]; 
	PostModel *pm =  [geoBloggerAppDelegate postModel];
	
	BOOL evenRow = NO;;
	if (indexPath.row % 2 == 0)
		evenRow = YES;
	
	/*
	 Cache formatter.
	 */
	static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"h:mm a"];
	} // if
	
	// entry
	UILabel *label;
	label = (UILabel *)[cell viewWithTag:NAME_TAG];
	label.text = [[pm contentArray] objectAtIndex:indexPath.row];
	if (evenRow)
		[label setBackgroundColor:[UIColor lightGrayColor]];
	
	// date
	NSDate *tempDate = [[pm timeArray] objectAtIndex:indexPath.row];
	label = (UILabel *)[cell viewWithTag:TIME_TAG];
	label.text = [dateFormatter stringFromDate:tempDate];
	if ([tempDate compare:[NSDate date]] == NSOrderedDescending)
		label.textColor = [UIColor blueColor];
	else if ([tempDate compare:[NSDate date]] == NSOrderedAscending)
		label.textColor = [UIColor redColor];
	else
		label.textColor = [UIColor blackColor];
	
	if (evenRow)
		[label setBackgroundColor:[UIColor lightGrayColor]];
	
	// image
	UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
	imageView.image = myImage;
	
	if (evenRow)
		[cell.contentView setBackgroundColor:[UIColor lightGrayColor]];
	
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

