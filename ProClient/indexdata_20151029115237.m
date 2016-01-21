//
//  indexdata.m
//  ProClient
//
//  Created by pipi on 15/10/29.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "indexdata.h"

@implementation indexdata
@synthesize userDefaults;


-(void)readNSUserDefaults
{
    userDefaults = [NSUserDefaults standardUserDefaults];
    [self readNSUserDefaults];
    _DefaultUser = [userDefaults valueForKey:@"username"];
    _DefaultPass = [userDefaults valueForKey:@"userpass"];
    _DefaultEid = [userDefaults valueForKey:@"eid"];
    _DefaultCst = [userDefaults valueForKey:@"cst"];
    
}
//
-(void)getOlData_setp1
{
    NetGetController *get =[[NetGetController alloc]init];
    if (_DefaultCst && _DefaultEid)
    {
        NSDictionary *_para = [[NSDictionary alloc]initWithObjectsAndKeys:_DefaultEid,@"eid",_DefaultCst,@"cst", nil];
        NSString *urlstr = [NSString stringWithFormat:@"%@,%@",Url_Ol,Url_Path];
        [get GetUrl:urlstr target:self selector:@selector(makeKeys_setp2:) parameters:_para];
    }
    
    
}

-(void)makeKeys_setp2:(NSArray *)backArray
{
    
}
@end
