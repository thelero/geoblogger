//
//  TimeWarpDetailController.h
//  Geoblogger
//
//  Created by Ivan Lee on 4/23/09.
//  Copyright 2009 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PostModel;

@interface TimeWarpDetailController : UIViewController {
	PostModel *postModel;
}

@property (nonatomic, retain) PostModel *postModel;

- (id) initWithPost:(PostModel *)pm;

@end
