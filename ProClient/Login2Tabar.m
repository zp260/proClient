//
//  Login2Tabar.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "Login2Tabar.h"

@implementation Login2Tabar
-(void)perform
{
    // 触发Segue的ViewController
    UIViewController * svc = (UIViewController *)self.sourceViewController;
    // 目标Segue的ViewController
    UIViewController * dvc = (UIViewController *)self.destinationViewController;
    // 为两个View的切换设置动画效果
    [UIView transitionFromView:svc.view toView:dvc.view duration:0.5 options:UIViewAnimationOptionTransitionNone completion:nil];
}
@end
