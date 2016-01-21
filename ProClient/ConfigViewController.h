//
//  IndexViewController.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Index_Content.h"
#import "WebViewController.h"

@interface ConfigViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *_bt;
@property (strong, nonatomic) IBOutlet UITableView *_TableView;

@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong,nonatomic) NSArray *_MenuArrayImage;
@property (strong,nonatomic) WebViewController *_WebView;

@end
