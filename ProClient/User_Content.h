//
//  User_Content.h
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User_Content : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong, nonatomic) IBOutlet UITableView *_tableView;

@end
