//
//  WebViewController.m
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize request;
@synthesize url;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)LoadWeb
{
    if (url)
    {
        request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [request setHTTPShouldHandleCookies:YES];
        
        [self._webView loadRequest:request];
    }
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self LoadWeb];
}
#pragma mark-webview Delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (webView.isLoading)
    {
        return;
    }

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webView didFailLoadWithError %@", error);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
