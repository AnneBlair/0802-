//
//  CViewController.m
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import "CViewController.h"
#import "YYGDataSoource.h"
#import "YYGDataLayer.h"
#import "YYGNotification.h"

@interface CViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Clabel;
@property(strong,nonatomic) YYGDataSoource * dataSource;

@end

@implementation CViewController
-(void)awakeFromNib
{
    self.dataSource=[YYGDataSoource new];
    [self.dataSource addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew context:NULL];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updata];
    
}


- (IBAction)Change:(UIButton *)sender {
    NSLog(@"this is C");
    int value=arc4random()%100;
    [YYGDataLayer setOtherData:value];
    [[NSNotificationCenter defaultCenter]postNotificationName:YYGDataChangedNotification object:nil userInfo:nil];
}

-(void)updata
{
    self.Clabel.text=[self.dataSource.data stringValue];
}


#pragma mark Class Notification
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
  
    if (object == self.dataSource && [keyPath isEqualToString:@"data"])
    {
        [self updata];
    }
}
@end
