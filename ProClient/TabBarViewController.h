//
//  TabBarViewController.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Index_ViewController.h"
#import "UserCenterViewController.h"
#import "ConfigViewController.h"

@interface TabBarViewController : UITabBarController
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IBOutlet UITabBarController *_TabbarController;

@property (strong, nonatomic) IBOutlet Index_ViewController *_IndexView;
@property (strong, nonatomic) IBOutlet UserCenterViewController *_UserCenterView;
@property (strong, nonatomic) IBOutlet ConfigViewController *_ConfigView;


@end
