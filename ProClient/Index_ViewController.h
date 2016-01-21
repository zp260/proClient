//
//  ConfigViewController.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "Index_Content.h"
#import "LearnViewController.h"

@interface Index_ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>




@property (strong, nonatomic) IBOutlet UITableView *_TableView;


@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong,nonatomic) NSArray *_MenuArrayImage;
@property (strong,nonatomic) WebViewController *_WebView;
@property (strong,nonatomic) Index_Content *_ProjectContentView;
@property (strong,nonatomic) NSArray *_programArrays;

#define url @"http://110.181.232.82:18080/eph/e/initkbproGrid?eid=50&cst=4NxCj0pigYk="
@end
