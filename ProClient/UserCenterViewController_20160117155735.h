//
//  UserCenterViewController.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User_Content.h"
#import "indexdata.h"
#import "ProgramPacketViewController.h"
#import "XirenCoustNav.h"

@interface UserCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    int _page;
    NSNumber *_currentPage;
    NSNumber *_totalPage;
    NetGetController *get;
    indexdata *data;
    NSMutableArray *more;
    IBOutlet UITableViewCell *_loadMoreCell;

}

@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong,nonatomic) IBOutlet UITableView *_TableView;
@property (strong,nonatomic) NSMutableArray *_programArrays;

@property (strong, nonatomic) IBOutlet UISearchBar *_SearchBar;

#define Url_ProgramBaseInfoPath @"/eph/e/inithisproGrid"

@end
