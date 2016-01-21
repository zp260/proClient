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
    [self getOLData];
    XirenCoustNav *CoustNav = [[XirenCoustNav alloc]init];
    [CoustNav initXirenNav:self TitleView:nil WithTitle:@"待评项目"];


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
#pragma mark - 网络数据接口处理
-(void)getOLData
{
    indexdata *data = [[indexdata alloc]init];
    [data readNSUserDefaults];
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst", nil];
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_ProgramBaseInfoPath];
    NetGetController *get = [[NetGetController alloc]init];
    [get GetUrl:urlstr target:self selector:@selector(dataCheck:) parameters:para];
}
-(void)dataCheck:(NSDictionary *)backData
{
    if (backData.count>0)
    {
        self._programArrays = [[NSMutableArray alloc]initWithArray:[backData objectForKey:@"rows"]];
        _totalPage = [backData objectForKey:@"totalPage"];
        _currentPage = [backData objectForKey:@"page"];
        [self._TableView reloadData];
    }
    

}
-(void)moreDataBack:(NSDictionary *)backData
{
    if (backData.count>0)
    {
        _totalPage = [backData objectForKey:@"totalPage"];
        _currentPage = [backData objectForKey:@"page"];
        if (_totalPage < _currentPage)
        {
            UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"提示" message:@"所有数据加载完毕" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {
            more = [[NSMutableArray alloc]initWithArray:[backData objectForKey:@"rows"]];
            //加载你的数据
            
            [self performSelectorOnMainThread:@selector(appendTableWith:) withObject:more waitUntilDone:NO];
        }
        
        
    }
}

#pragma mark - 数据代理 datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self._programArrays.count+1;
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
    if([indexPath row] == ([self._programArrays count]))
    {
        
        //创建loadMoreCell
        
        return _loadMoreCell;
        
    }

    static NSString *contentListIdentifier= @"Config";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:contentListIdentifier];
    if (cell ==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentListIdentifier];
    }
    else
    {
        //删除cell中的子对象
        while([cell.contentView.subviews lastObject]!=nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            
            
        }
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSUInteger row= indexPath.row;
    
    if (self._programArrays)
    {
        //NSLog(@"%@",[self._programArrays objectAtIndex:row]);
        cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
        cell.textLabel.text=[[self._programArrays objectAtIndex:row] objectForKey:@"projectname"];

    }
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self._programArrays count])
    {
        
    }

    
    ProgramPacketViewController *packetCtrol = [[ProgramPacketViewController alloc]init];
    NSInteger row = indexPath.row;
    packetCtrol.pid = [[self._programArrays objectAtIndex:row] objectForKey:@"pid"];
    packetCtrol.TabIdex = 0;
    [self.navigationController pushViewController:packetCtrol animated:YES];
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

#pragma mark-分页相关
//加载数据的方法:
- (IBAction)loadMoreData:(id)sender
{
    if (_currentPage.intValue >=1 && _currentPage.intValue < _totalPage.intValue)
    {
        NSString *nextPage = [NSString stringWithFormat:@"%d", _currentPage.intValue +1];
        NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",nextPage,@"page" ,nil];
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_ProgramBaseInfoPath];
        [get GetUrl:urlstr target:self selector:@selector(moreDataBack:) parameters:para];
    }
    else
    {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"提示" message:@"已经没有更多数据可以加载了。。" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}



/**
 *  添加数据到列表:
 *
 *  @param data 加载更多返回的  --NSMutableArray *more
 */
-(void) appendTableWith:(NSMutableArray *)data

{
    
    for (int i=0;i<[data count];i++)
    {
        NSLog(@"%@",[data objectAtIndex:i]);
        [self._programArrays addObject:[data objectAtIndex:i]];
        
    }
    NSLog(@"count %lu %@",(unsigned long)self._programArrays.count,self._programArrays);
    [self._TableView reloadData];
    
    
    
    
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
