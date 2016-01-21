//
//  User_Content.m
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "User_Content.h"

@interface User_Content ()

@end

@implementation User_Content

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self makeConfigMenu];
    [self._tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)BackClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)makeConfigMenu
{
    self._MenuArray  = [[NSArray alloc]initWithObjects:@"1:标书制作是否规范",@"2:标书制作是否有倾向性",@"3:代理机构组织是否正规",@"4:是否遵守评审纪律",@"5:是否随意出入评审现场行为",@"6:是否暗示或诱导评审专家",@"7:是否全程录像", nil];
    
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
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"是",@"否", nil]];
    seg.frame = CGRectMake(self._tableView.width - 80-5, (cell.height - 29)/2 , 80, 29);
    [cell.contentView addSubview:seg];
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
    cell.textLabel.text=[self._MenuArray objectAtIndex:row];
    
    
    return cell;
    
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
