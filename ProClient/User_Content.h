//
//  User_Content.h
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indexdata.h"

@interface User_Content : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    NSDictionary *PackageDic;
    indexdata *data;
    UISegmentedControl *seg;
    NSMutableArray *segSlectData;
    UITextView *_YjText;
}

@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong, nonatomic) IBOutlet UITableView *_tableView;

@property (strong, nonatomic) IBOutlet UILabel *_JGname;
@property (strong, nonatomic) IBOutlet UILabel *_PgName;
@property (strong, nonatomic) IBOutlet UILabel *_PackageName;
@property (strong, nonatomic) IBOutlet UILabel *_Money;
@property (strong, nonatomic) IBOutlet UILabel *_ZhuanJiaName;//取已经登录的ID获得专家名称

@property (strong,nonatomic) NSString *sid;
@property (strong,nonatomic) NSArray *_ProjectArrayData;

#define Url_ProgramBaseInfoPath @"/eph/e/findsecinfo"
#define Url_PingJia @"/eph/e/exppj"
@end
