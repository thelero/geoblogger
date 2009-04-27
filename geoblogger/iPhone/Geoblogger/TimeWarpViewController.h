//
//  TimeWarpViewController.h
//  Geoblogger
//
//  Created by Ivan Lee on 4/15/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PostModel, GeobloggerAppDelegate;

@interface TimeWarpViewController : UITableViewController {
	PostModel *postModel;
}

@property (nonatomic, retain) PostModel *postModel;

- (UITableViewCell *)tableviewCellWithReuseIdentifier:(NSString *)identifier;
- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end
