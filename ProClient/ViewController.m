//
//  ViewController.m
//  ProClient
//
//  Created by pipi on 15/9/24.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self iniUI];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)iniUI
{
    UIImageView *_topImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 100)];
    _topImgView.image = [UIImage imageNamed:@""];
    
    
    UILabel *_LbUsername = [[UILabel alloc]initWithFrame:CGRectMake(5, _topImgView.bottom+50, 80, 35)];
    _LbUsername.text = @"用户名";
    UITextField *_Tfusername = [[UITextField alloc]initWithFrame:CGRectMake(_LbUsername.right, _LbUsername.top, kDeviceWidth-_LbUsername.width-10, _LbUsername.height)];
    
    
    UILabel *_LbPass = [[UILabel alloc]initWithFrame:CGRectMake(_LbUsername.left, _LbUsername.bottom+50, 100, 35)];
    _LbPass.text = @"密码";
    UITextField *_TfPass = [[UITextField alloc]initWithFrame:CGRectMake(_LbPass.right+5, _LbPass.top, kDeviceWidth-_LbPass.width-10, 35)];
    [_TfPass setBorderStyle:UITextBorderStyleLine];
    
    UIButton *_BtLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _BtLogin.frame =CGRectMake(5, _LbPass.bottom+50, kDeviceWidth-10, 35);
    [_BtLogin setTitle:@"登陆" forState:UIControlStateNormal];
    _BtLogin.tintColor = [UIColor whiteColor];
    _BtLogin.backgroundColor = [UIColor blueColor];
    
    NSLog(@"%@ bt",_BtLogin);
    [self.view addSubview:_topImgView];
    [self.view addSubview:_LbUsername];
    [self.view addSubview:_Tfusername];
    [self.view addSubview:_LbPass];
    [self.view addSubview:_TfPass];
    [self.view addSubview:_BtLogin];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginclick:(id)sender
{


}


@end
