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
#import "ProgramPacketViewController.h"
#import "indexdata.h"
#import "XirenCoustNav.h"

@interface Index_ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    int _page;
    NSNumber *_currentPage;
    NSNumber *_totalPage;
    NetGetController *get;
    indexdata *data;
    NSMutableArray *more;
    IBOutlet UITableViewCell *_loadMoreCell;
}




@property (strong, nonatomic) IBOutlet UITableView *_TableView;


@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong,nonatomic) NSArray *_MenuArrayImage;
@property (strong,nonatomic) WebViewController *_WebView;
@property (strong,nonatomic) Index_Content *_ProjectContentView;
@property (strong,nonatomic) NSMutableArray *_programArrays;


#define Url_ProgramBaseInfoPath @"/eph/e/initkbproGrid"
@end
