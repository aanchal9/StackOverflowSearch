//
//  DatePickerViewController.h
//  StackOverflowSearch
//
//  Created by Monica on 02/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerDelegate <NSObject>

- (void) startDatePicked:(NSString *)date;
- (void) endDatePicked:(NSString *)date;

@end

@interface DatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property id<DatePickerDelegate> delegate;
@property NSString *button;

- (void)doneButtonClicked;

@end
