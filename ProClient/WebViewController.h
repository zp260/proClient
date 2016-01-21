//
//  WebViewController.h
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *_webView;
@property (strong,nonatomic)    NSString *url;
@property (nonatomic)           NSString *UserAgent;
@property (strong,nonatomic) NSMutableURLRequest *request;
@end
