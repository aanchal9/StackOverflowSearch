//
//  ResultsViewController.m
//  StackOverflowSearch
//
//  Created by Monica on 03/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "ResultsViewController.h"
#import "WebViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.results = [[NSMutableDictionary alloc] init];
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0];
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        self.results = [NSMutableDictionary dictionary];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Oops!! No results found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *items = [dictionary valueForKey:@"items"];
    for (NSDictionary *dict in items) {
        NSString *link = [dict valueForKey:@"link"];
        NSString *title = [dict valueForKey:@"title"];
        [self.results setValue:link forKey:title];
    }
    }
        // Do any additional setup after loading the view.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.rowHeight = 50;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *title = [[self.results allKeys] objectAtIndex:indexPath.row];
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = title;
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    WebViewController *webViewC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
//    NSString *link = [[self.results allValues] objectAtIndex:indexPath.row];
//    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:link]];
//    [webViewC setUrl:link];
//    [self presentViewController:webViewC animated:YES completion:nil];
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"TableViewSegue"]) {
        NSString *link = [[self.results allValues] objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        [[segue destinationViewController] setUrl:link];
    }
    // Get the new view controller using [segue destinationViewController].
   //  Pass the selected object to the new view controller.
}


@end
