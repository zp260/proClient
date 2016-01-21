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
    [self initSegData];
    // Do any additional setup after loading the view from its nib.
   [self makeConfigMenu];
    data = [[indexdata alloc]init];
    [data readNSUserDefaults];
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",_sid,@"sid", nil];
    if (data.DefaultCst && data.DefaultEid && _sid)
    {
        
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_ProgramBaseInfoPath];
        
        NetGetController *get =[[NetGetController alloc]init];
        [get GetUrl:urlstr target:self selector:@selector(makeKeys_setp2:) parameters:para];
    }


}
/**
 *  初始化Segment 存储数组
 */
-(void)initSegData
{
    segSlectData = [[NSMutableArray alloc]initWithObjects:@"是",@"是",@"是",@"是",@"是",@"是",@"是", nil];
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
        PackageDic = backArray;
        self._PackageName.text = [PackageDic valueForKey:@"sectionname"];
        self._Money.text = [NSString stringWithFormat:@"%@",[PackageDic valueForKey:@"budgetfee"]];
        //[self._tableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)BackClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//选项
-(void)makeConfigMenu
{
    self._MenuArray  = [[NSArray alloc]initWithObjects:@"1:标书制作是否规范",@"2:标书制作是否有倾向性",@"3:代理机构组织是否正规",@"4:是否遵守评审纪律",@"5:是否随意出入评审现场行为",@"6:是否暗示或诱导评审专家",@"7:是否全程录像", nil];
    
}
#pragma mark - table header
-(void)viewWillAppear:(BOOL)animated
{
    UIView *_Footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 90)];
    UILabel *_Lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 30)];
    _Lable.text = @"意见和建议";
    _Lable.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
    
    _YjText =[[UITextView alloc]initWithFrame:CGRectMake(10, 30, self._tableView.right-10, 60)];
    
    NSLog(@"%@",self._tableView);
    _YjText.layer.borderColor = [UIColor grayColor].CGColor;
    _YjText.layer.borderWidth = 0.5;
    _YjText.layer.cornerRadius = 1.0;
    _YjText.delegate =self;
    
    [_Footer addSubview:_Lable];
    [_Footer addSubview:_YjText];
    self._tableView.tableFooterView = _Footer;
    
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
    else
    {
        //删除cell中的子对象
        while([cell.contentView.subviews lastObject]!=nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            
            
        }
    }

    
    NSUInteger row= indexPath.row;
    
    seg = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"是",@"否", nil]];
    seg.frame = CGRectMake(self._tableView.width - 80-5, (cell.height - 29)/2 , 80, 29);
    seg.selectedSegmentIndex = 0;
    [seg addTarget:self action:@selector(cellSegClick:) forControlEvents:UIControlEventValueChanged];
    seg.tag = row;
    [cell.contentView addSubview:seg];
    
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
    cell.textLabel.text=[self._MenuArray objectAtIndex:row];
    
    
    return cell;
    
}
#pragma mark-每个CELL seg点击事件处理
-(void)cellSegClick:(UISegmentedControl *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    NSString *whichCode = [[NSString alloc]init];
    if (sender.selectedSegmentIndex == 0)
    {
        whichCode = @"是";
    }
    else
    {
        whichCode = @"否";
    }
    [segSlectData replaceObjectAtIndex:sender.tag withObject:whichCode];
    
}
- (IBAction)submit:(id)sender
{
    NSLog(@"segdatais %@",segSlectData);
    NetGetController *pingjia_Post = [[NetGetController alloc]init];
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_PingJia];
    NSLog(@"标包所属项目列表%@,标包列表%@",self._ProjectArrayData,PackageDic);
    NSLog(@"%@",seg);
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:
                          data.DefaultEid,@"eid",
                          [self._ProjectArrayData valueForKey:@"agency"],@"agency",
                          [self._ProjectArrayData valueForKey:@"agencyid"],@"agenid",
                          [self._ProjectArrayData valueForKey:@"pid"],@"pid",//项目PID
                          [self._ProjectArrayData valueForKey:@"projectname"],@"projectname",//项目名称
                          _sid,@"sid",//标包ID
                          [PackageDic objectForKey:@"sectionname"],@"sectionname",//标段名称
                          [PackageDic objectForKey:@"kbdatatime"],@"psstarttime",//评审时间
                          [PackageDic objectForKey:@"kbplace"],@"psplace",//评审地点
                          [segSlectData objectAtIndex:0],@"isbszzgf",//标书制作规范
                          [segSlectData objectAtIndex:1],@"isbszzyqxx",//是否有倾向性
                          [segSlectData objectAtIndex:2],@"isdljgzzzg",//是否正规
                          [segSlectData objectAtIndex:3],@"iszspsjl",//评审纪律
                          [segSlectData objectAtIndex:4],@"issycrpsxcxw",//有无随意出入评审现场行为
                          [segSlectData objectAtIndex:5],@"isashydpszj",//有无暗示或诱导评审专家
                          [segSlectData objectAtIndex:6],@"isqclx",//全程录像
                          _YjText.text,@"yjhjy",//意见和建议
                          data.DefaultCst,@"cst",
                          nil];
    
    NSLog(@"提交的字段值为%@",para);
    [pingjia_Post GetUrl:urlstr target:self selector:@selector(pingjia_PostBack:) parameters:para];
    
}
/**
 *  接受评价提交后返回的数据
 */
-(void)pingjia_PostBack:(NSDictionary *)datas
{
    if(datas.count>1)
    {
        if ([datas valueForKey:@"success"])
        {
            NSLog(@"%@",[[datas valueForKey:@"success"]class]);
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提交成功" message:[datas valueForKey:@"msg"] delegate:nil cancelButtonTitle:@"确认并返回" otherButtonTitles:nil];
            [alter show];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
}
#pragma mark-textView Delegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect frame = self._tableView.frame;
    int offset = frame.origin.y + frame.size.height+20 - (self.view.frame.size.height - 310);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, self.view.frame.origin.y-offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}
//当用户按下return键或者按回车键，keyboard消失
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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
