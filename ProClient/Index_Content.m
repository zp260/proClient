//
//  Index_Content.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "Index_Content.h"

@interface Index_Content ()

@end

@implementation Index_Content

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    data = [[indexdata alloc]init];
    [data readNSUserDefaults];    
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",_sid,@"sid", nil];
    if (data.DefaultCst && data.DefaultEid && _sid)
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
        NSString *ProgramTitle = [backArray objectForKey:@"sectionname"];
        CGSize size = [ProgramTitle sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(self._packLable.width,10000.0f)lineBreakMode:UILineBreakModeWordWrap];
        self._packLable.frame = CGRectMake(self._packLable.left, self._packLable.top, self._packLable.width, size.height);
        self._packLable.text = [[NSString alloc]initWithFormat:@"%@%@",@"标包名称：",[backArray objectForKey:@"sectionname"]];
        _projectNum.text = [[NSString alloc]initWithFormat:@"%@%@",_projectNum.text,[backArray objectForKey:@"sectionnum"]];


    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-签到
- (IBAction)SignBtClick:(id)sender
{
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",_sid,@"sid",@"1",@"hfqrzt", nil];
    if (data.DefaultCst && data.DefaultEid && _sid)
    {
        
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_Sign];
        
        get =[[NetGetController alloc]init];
        [get GetUrl:urlstr target:self selector:@selector(sign_step2:) parameters:para];
    }

    

}

-(void)sign_step2:(NSDictionary *)backArray
{
    if (backArray.count>0)
    {
        NSString *success = [backArray objectForKey:@"success"];
        NSString *msg = [backArray objectForKey:@"msg"];
        
        self._RepeatBt.hidden= YES;
        self._SignBT.hidden =YES;
        self.SucessBT.hidden =NO;
        
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    
}

#pragma mark- 回复
- (IBAction)RepeatBtClick:(id)sender
{
    NSDictionary *para = [[NSDictionary alloc]initWithObjectsAndKeys:data.DefaultEid,@"eid",data.DefaultCst,@"cst",_sid,@"sid",@"1",@"hfqrzt", nil];
    if (data.DefaultCst && data.DefaultEid && _sid)
    {
        
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",Url_RootAdress,Url_Reply];
        
        get =[[NetGetController alloc]init];
        [get GetUrl:urlstr target:self selector:@selector(reply_step2:) parameters:para];
    }


}

-(void)reply_step2:(NSDictionary *)backArray
{
    if (backArray.count>0)
    {
        NSString *success = [backArray objectForKey:@"success"];
        NSString *msg = [backArray objectForKey:@"msg"];
        
        self._RepeatBt.hidden= YES;
        self._SignBT.hidden =YES;
        self.SucessBT.hidden =NO;
        
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

        
    }
    
}

- (IBAction)SuccessBtClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
