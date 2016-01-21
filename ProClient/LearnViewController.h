//
//  LearnViewController.h
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface LearnViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray *_MenuArray;
@property (strong, nonatomic) IBOutlet UITableView *_TableView;


@end
