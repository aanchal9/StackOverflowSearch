//
//  WebViewController.h
//  StackOverflowSearch
//
//  Created by Monica on 04/02/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *url;

@end
