//
//  UserCenterViewController.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User_Content.h"
@interface UserCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong, nonatomic) IBOutlet UITableView *_TableView;

@end
