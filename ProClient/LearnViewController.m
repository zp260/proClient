//
//  LearnViewController.m
//  ProClient
//
//  Created by pipi on 15/9/26.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "LearnViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    self._MenuArray  = [[NSArray alloc]initWithObjects:@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条",@"中华人民共和国财政部第18号令第四十条", nil];
    
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
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *_webView = [[WebViewController alloc]init];
    _webView.url = @"http://www.mof.gov.cn/zhengwuxinxi/zhengcefabu/201509/t20150925_1475838.htm";
    [self.navigationController pushViewController:_webView animated:YES];
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
