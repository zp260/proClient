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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SignBtClick:(id)sender
{
    self._RepeatBt.hidden= YES;
    self._SignBT.hidden =YES;
    self.SucessBT.hidden =NO;
}
- (IBAction)RepeatBtClick:(id)sender
{
    self._RepeatBt.hidden= YES;
    self._SignBT.hidden =YES;
    self.SucessBT.hidden =NO;
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
