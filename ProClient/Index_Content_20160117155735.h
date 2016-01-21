//
//  Index_Content.h
//  ProClient
//
//  Created by pipi on 15/9/25.
//  Copyright © 2015年 pipi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indexdata.h"

@interface Index_Content : UIViewController
{
    IBOutlet UILabel *_projectNum;
    NetGetController *get;
    indexdata *data;
    
}
@property (strong, nonatomic) IBOutlet UIButton *_SignBT;
@property (strong, nonatomic) IBOutlet UIButton *_RepeatBt;
@property (strong, nonatomic) IBOutlet UILabel *_packLable;

@property (strong, nonatomic) IBOutlet UIButton *SucessBT;

@property (strong,nonatomic) NSString *sid;
@property (strong,nonatomic) NSArray *PcontentAaary;


#define Url_ProgramBaseInfoPath @"/eph/e/findsecinfo"

#define Url_Reply @"/eph/e/expreply"

#define Url_Sign @"/eph/e/expsign"

@end
