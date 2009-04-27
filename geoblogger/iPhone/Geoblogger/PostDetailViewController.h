//
//  PostDetailViewController.h
//  Geoblogger
//
//  Created by Ivan Lee on 4/15/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PostDetailViewController : UITableViewController {
	NSDictionary *detailItem;
}

@property (nonatomic, retain) NSDictionary *detailItem;

@end
