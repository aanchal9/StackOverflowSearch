//
//  DatePickerViewController.m
//  StackOverflowSearch
//
//  Created by Monica on 02/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClicked)];
    self.navigationItem.leftBarButtonItem = backButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)doneButtonClicked {
    
    NSDate *date = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    NSString *newDate = [dateFormatter stringFromDate:date];
    
    if ([self.button isEqualToString:@"start"]) {
        [self.delegate startDatePicked:newDate];
    }
    else{
        [self.delegate endDatePicked:newDate];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
