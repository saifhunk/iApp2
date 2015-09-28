//
//  WebviewViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 9/28/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "WebviewViewController.h"

@interface WebviewViewController ()<UIWebViewDelegate>

@end

@implementation WebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView * webview1= [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:webview1];
    [self.view bringSubviewToFront:webview1];
    webview1.delegate =self;

    [webview1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wwww.google.com"]]];
    [webview1 setScalesPageToFit:YES];
    [webview1.scrollView setScrollEnabled:YES];
    [webview1 reload];
}




- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request   navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
