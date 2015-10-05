//
//  ResultsViewController.h
//  StackOverflowSearch
//
//  Created by Monica on 03/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property NSString *url;
@property NSMutableDictionary *results;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
