//
//  ConfigViewController.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "Index_ViewController.h"

@interface Index_ViewController ()

@end

@implementation Index_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeConfigMenu];
    [self._TableView reloadData];
    NSLog(@"%@",self._TableView.tableHeaderView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LearnClick:(id)sender
{
    LearnViewController *learnCtrol =[[LearnViewController alloc]init];
    [self.navigationController pushViewController:learnCtrol animated:YES];
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
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"项目列表";
//}
#pragma mark - table delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contentListIdentifier= @"Config";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:contentListIdentifier];
    if (cell ==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentListIdentifier];
    }
    else{
        //删除cell中的子对象
        while([cell.contentView.subviews lastObject]!=nil){
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            
            
        }
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSUInteger row= indexPath.row;
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
    cell.textLabel.text=[self._MenuArray objectAtIndex:row];

    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self._WebView = [[WebViewController alloc]init];
    self._ProjectContentView = [[Index_Content alloc]init];
    NSInteger row = indexPath.row;
    [self.navigationController pushViewController:self._ProjectContentView animated:YES];
//    switch (row) {
//        case 0:
//            [self.navigationController pushViewController:self._WebView animated:YES];
//            break;
//        case 1:
//            [self.navigationController pushViewController:self._WebView animated:YES];
//            
//            break;
//        default:
//            [self.navigationController pushViewController:self._ProjectContentView animated:YES];
//            break;
//    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UILabel *SectionLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    SectionLable.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    SectionLable.textAlignment =NSTextAlignmentCenter;
    SectionLable.textColor=[UIColor colorWithRed:43.0f/255.0f green:121.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    SectionLable.text=@"项目列表";
    return SectionLable;
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
