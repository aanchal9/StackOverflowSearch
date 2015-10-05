//
//  ViewController.m
//  StackOverflowSearch
//
//  Created by Monica on 02/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"
#import "ResultsViewController.h"
#import "WebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startDateTextField.enabled = NO;
    self.endDateTextField.enabled = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startDatePicked:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    NSDate *endDate = [dateFormatter dateFromString:self.endDateTextField.text];
    NSDate *startDate = [dateFormatter dateFromString:date];
    if([endDate compare:startDate] < 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Wrong Date!!!" message:@"Start date should be smaller than end date" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        self.startDateTextField.text=@"";
    }
    else
    {
        self.startDateTextField.text = date;
    }

    
}

- (void) endDatePicked:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    NSDate *endDate = [dateFormatter dateFromString:date];
    NSDate *startDate = [dateFormatter dateFromString:self.startDateTextField.text];
    if([endDate compare:startDate] < 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Wrong Date!!!" message:@"End date should be greater than start date" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        self.endDateTextField.text=@"";
    }
    else
    {
        self.endDateTextField.text = date;
    }
}

- (IBAction)getStartDate:(id)sender {
    
    DatePickerViewController *myController = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
    myController.delegate = self;
    [myController setValue:@"start" forKey:@"button"];
    [self.navigationController pushViewController:myController animated:YES];
}

- (IBAction)getEndDate:(id)sender {
    DatePickerViewController *myController = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
    myController.delegate = self;
    [myController setValue:@"end" forKey:@"button"];
    [self.navigationController pushViewController:myController animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)searchButtonClicked:(id)sender {
    
    if ([self.searchTextField.text isEqualToString:@""] || [self.startDateTextField.text isEqualToString:@""] || [self.endDateTextField.text isEqualToString:@""] ) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
        NSString *searchString = self.searchTextField.text;
        
        NSString *newString = [searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    ResultsViewController *resultsController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultsViewController"];
    
    NSString *url = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search/advanced?fromdate=%@&todate=%@&order=desc&sort=activity&q=%@&accepted=True&site=stackoverflow",self.startDateTextField.text,self.endDateTextField.text,newString];
        
    [resultsController setValue:url forKey:@"url"];
    
    [self.navigationController pushViewController:resultsController animated:YES];
    }
}
@end
