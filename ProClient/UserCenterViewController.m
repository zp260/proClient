//
//  UserCenterViewController.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "UserCenterViewController.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeConfigMenu];
    [self._TableView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)makeConfigMenu
{
    self._MenuArray  = [[NSArray alloc]initWithObjects:@"大同市龙园小区监控项目",@"大同市南郊区实验中学监控项目",@"大同市南郊区实验中学信息化工程项目",@"大同市南郊区实验中学网络工程项目",@"大同市南郊区实验中学网络工程项目一",@"大同市南郊区实验中学网络工程项目二",@"大同市南郊区实验中学网络工程项目三", nil];
    
}

#pragma mark - 数据代理 datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self._MenuArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - table delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *contentListIdentifier= @"UserCenter";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:contentListIdentifier];
    if (cell ==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentListIdentifier];
    }
    else{
        //删除cell中的子对象
        while([cell.contentView.subviews lastObject]!=nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            
            
        }
    }
    //cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    
    NSUInteger row= indexPath.row;
    UILabel *PingJia  = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth-60, 10, 60, 30)];
//    PingJia.backgroundColor =[UIColor grayColor];
    PingJia.textColor=[UIColor colorWithRed:43.0f/255.0f green:121.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    PingJia.textAlignment = NSTextAlignmentCenter;
    PingJia.text = @"评价";
    [cell.contentView addSubview:PingJia];
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
    cell.textLabel.text=[self._MenuArray objectAtIndex:row];
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    User_Content *userContent =[[User_Content alloc]init];
    [self.navigationController pushViewController:userContent animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
