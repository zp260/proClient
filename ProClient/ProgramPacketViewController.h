//
//  ProgramPacketViewController.h
//  ProClient
//
//  Created by pipi on 15/10/30.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indexdata.h"
#import "Index_Content.h"
#import "User_Content.h"

@interface ProgramPacketViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    int _page;
    NSNumber *_currentPage;
    NSNumber *_totalPage;
    NSMutableDictionary *para;
    NetGetController *get;
    indexdata *data;
    NSMutableArray *more;
    IBOutlet UITableViewCell *_loadMoreCell;
}
@property (strong, nonatomic) IBOutlet UITableView *_table;
@property (strong, nonatomic) IBOutlet UILabel *_TableHeader;

@property (strong,nonatomic) NSString *pid;
@property (strong,nonatomic) NSMutableArray *packetArray;

@property int TabIdex;

@property (strong,nonatomic) NSArray *_ProjectArrayData; //项目包数据


#define Url_ProgramBaseInfoPath @"/eph/e/findsecpage"

@end
