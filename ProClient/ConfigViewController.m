//
//  IndexViewController.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XirenCoustNav *CoustNav = [[XirenCoustNav alloc]init];
    [CoustNav initXirenNav:self TitleView:nil WithTitle:@"设置"];
    
    // Do any additional setup after loading the view from its nib.
    [self makeConfigMenu];
    [self._TableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)makeConfigMenu
{
    self._MenuArray  = [[NSArray alloc]initWithObjects:@"注销",@"操作说明", nil];
    self._MenuArrayImage = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"AboutUs"],[UIImage imageNamed:@"LoginOut"], nil];
}
- (IBAction)_btclick:(id)sender {
    Index_Content *ContentCtrol = [[Index_Content alloc]init];
    [self.navigationController pushViewController:ContentCtrol animated:YES];
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
    cell.imageView.image = [self._MenuArrayImage objectAtIndex:row];;
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexdata *UserCtrol = [[indexdata alloc]init];
    self._WebView = [[WebViewController alloc]init];
    ShuoMingViewController *shuoMing = [[ShuoMingViewController alloc]init];
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
            [UserCtrol LoginOut];
            NSLog(@"%@",self.navigationController);
            [super.navigationController popToRootViewControllerAnimated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:shuoMing animated:YES];
            

            break;
        default:
            break;
    }
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
