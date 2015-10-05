//
//  ViewController.h
//  StackOverflowSearch
//
//  Created by Monica on 02/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerViewController.h"

@interface ViewController : UIViewController<DatePickerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;

@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;
- (IBAction)getStartDate:(id)sender;
- (IBAction)getEndDate:(id)sender;


- (IBAction)searchButtonClicked:(id)sender;

@end

