//
//  MainViewController.m
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize userDefaults;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    userDefaults = [NSUserDefaults standardUserDefaults];
    [self readNSUserDefaults];
    if (_DefaultEid && _DefaultPass && _DefaultUser && _DefaultCst)
    {
        [self DoLogin];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)_LoginClick:(id)sender
{
    
    if (self._PassTextFiled.text.length>0 && self._UserTextFiled.text.length>0)
    {
        [self checkUserPass];
    }
    
//    if (false)
//    {
//        TabBarViewController *tab =[[TabBarViewController alloc]init];
//        [self.navigationController pushViewController:tab animated:YES];
//    }
    
    
}
-(void)checkUserPass
{
    NSDictionary *_para = [[NSDictionary alloc]initWithObjectsAndKeys:self._UserTextFiled.text,@"sjhm",self._PassTextFiled.text,@"pass", nil];
//    NSDictionary *_para = [[NSDictionary alloc]initWithObjectsAndKeys:@"345",@"sjhm",@"1",@"pass", nil];
    NSString *_url = @"http://110.181.194.119:18080/eph/e/login";
    NetGetController *_netGet = [[NetGetController alloc]init];
    [_netGet PostUrl:_url target:self selector:@selector(LoadData:) parameters:_para];
}
-(void)LoadData:(NSDictionary *)backdata
{
    NSLog(@"%@",backdata);
    if (backdata.count>=2)
    {
        
        if ([backdata objectForKey:@"cst"] && [backdata objectForKey:@"eid"])
        {
            [userDefaults setObject:[backdata objectForKey:@"cst"] forKey:@"cst"];
            [userDefaults setObject:[backdata objectForKey:@"eid"] forKey:@"eid"];
            [self saveNSUserDefaults];
            [self DoLogin];
        }
    }

}
#pragma mark - NSUserDefaults
-(void)saveNSUserDefaults
{
    [userDefaults setObject:self._UserTextFiled.text forKey:@"username"];
    [userDefaults setObject:self._PassTextFiled.text forKey:@"userpass"];
    
}
-(void)readNSUserDefaults
{
    _DefaultUser = [userDefaults valueForKey:@"username"];
    _DefaultPass = [userDefaults valueForKey:@"userpass"];
    _DefaultEid = [userDefaults valueForKey:@"eid"];
    _DefaultCst = [userDefaults valueForKey:@"cst"];
    
}
-(void)DoLogin
{
    TabBarViewController *tab =[[TabBarViewController alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
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
