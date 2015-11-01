//
//  WebviewViewController.m
//  iApp
//
//  Created by Saif Chaudhary on 9/28/15.
//  Copyright (c) 2015 Saif Chaudhary. All rights reserved.
//

#import "WebviewViewController.h"
#import "Header.h"

@interface WebviewViewController ()<UIWebViewDelegate>
{
    NSString * strurl;
}

@end

@implementation WebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupNavigationBar];
    // Do any additional setup after loading the view.
    
    CGRect rect = [UIScreen mainScreen].bounds;
    UIWebView * webview1= [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    [self.view addSubview:webview1];
    [self.view bringSubviewToFront:webview1];
    webview1.delegate =self;
    if ([strurl rangeOfString:@"http://"].location == NSNotFound)
    {
        
        strurl = [NSString stringWithFormat:@"http://%@",strurl];
    }
    [webview1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strurl]]];
    [webview1 setScalesPageToFit:YES];
    [webview1.scrollView setScrollEnabled:YES];
    [webview1 reload];

    // Do any additional setup after loading the view.
}

-(void)setupNavigationBar
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.tintColor = AppGrayColor;
    
}


-(void)GetUrl:(NSString *)url;
{
    strurl = url;
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
