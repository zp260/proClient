//
//  ProgramPacketViewController.m
//  ProClient
//
//  Created by pipi on 15/10/30.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "ProgramPacketViewController.h"

@interface ProgramPacketViewController ()

@end

@implementation ProgramPacketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getOlData_setp1];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
//    self._TableHeader.frame = CGRectMake(0, 0, kDeviceWidth, 30);
//    self._table.tableHeaderView  = self._TableHeader;
//    NSLog(@"%@",self._table);
}
/**
 * 获取评审项目列表信息
 */
-(void)getOlData_setp1
{
    data = [[indexdata alloc]init];
    [data readNSUserDefaults];
    
    
    para = [[NSMutableDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",_pid,@"pid", nil];
    NSLog(@"%@",data.DefaultCst);
    if (data.DefaultCst && data.DefaultEid && _pid)
    {
        
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_ProgramBaseInfoPath];
        
        get =[[NetGetController alloc]init];
        [get GetUrl:urlstr target:self selector:@selector(makeKeys_setp2:) parameters:para];
    }
    
    
}
/**
 *  处理返回JSON并解析为数组
 *  生成PID-项目ID
 *
 *  @param backArray 返回的JSON数组
 */
-(void)makeKeys_setp2:(NSDictionary *)backArray
{
    if(backArray.count>0)
    {
        _totalPage = [backArray objectForKey:@"totalPage"];
        _currentPage = [backArray objectForKey:@"page"];
        _packetArray =[[NSMutableArray alloc]initWithArray:[backArray objectForKey:@"rows"]];//标包的总数据包
        [self._table reloadData];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据代理 datasource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_packetArray)
    {
        return _packetArray.count+1;
    }
    else
    {
        return 1;
    }
    
    
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
    if([indexPath row] == ([self.packetArray count]))
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
    else{
        //删除cell中的子对象
        while([cell.contentView.subviews lastObject]!=nil){
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            
            
        }
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSUInteger row= indexPath.row;
    
    if (_packetArray>0)
    {
        //NSLog(@"%@",[self._programArrays objectAtIndex:row]);
        cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
        cell.textLabel.text=[[_packetArray objectAtIndex:row] objectForKey:@"sectionname"];
        
    }
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSString *sid = [[self.packetArray objectAtIndex:row] objectForKey:@"sid"];
    if (_TabIdex == 0)
    {
        Index_Content *packetCtrol = [[Index_Content alloc]init];
        packetCtrol.sid = sid;
        [self.navigationController pushViewController:packetCtrol animated:YES];

    }
    else
    {
        User_Content *userCtrol = [[User_Content alloc]init];
        userCtrol.sid =sid;
        userCtrol._ProjectArrayData = self._ProjectArrayData;
        [self.navigationController pushViewController:userCtrol animated:YES];
        
    }
   

}


#pragma mark-分页相关
//加载数据的方法:
- (IBAction)loadMoreData:(id)sender
{
    if (_currentPage.intValue >=1)
    {
        NSString *nextPage = [NSString stringWithFormat:@"%d", _currentPage.intValue +1];
        [para setObject:nextPage forKey:@"page"];
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_ProgramBaseInfoPath];
        [get GetUrl:urlstr target:self selector:@selector(moreDataBack:) parameters:para];
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
        [self.packetArray addObject:[data objectAtIndex:i]];
        
    }
    [self._table reloadData];
    
    
    
    
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
