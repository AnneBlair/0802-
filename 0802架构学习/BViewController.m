//
//  BViewController.m
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import "BViewController.h"
#import "YYGDataLayer.h"
#import "YYGDataSoource.h"
#import "YYGNotification.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Blabel;
@property(strong,nonatomic) YYGDataSoource * dataSource;

@end

@implementation BViewController
-(void)awakeFromNib
{
    self.dataSource=[YYGDataSoource new];
    [self.dataSource addObserver:self
                      forKeyPath:@"data"
                         options:NSKeyValueObservingOptionNew
                         context:NULL];
}

-(void)dealloc
{
    [self.dataSource removeObserver:self forKeyPath:@"data"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updata];
    NSLog(@"--%@--",self.Blabel.text);
    
}

- (IBAction)Bchange:(id)sender
{
    NSLog(@"this is B");
    int value=arc4random()%100;
    [YYGDataLayer setData:value];
    [[NSNotificationCenter defaultCenter]postNotificationName:YYGDataChangedNotification
                                                       object:nil
                                                     userInfo:nil];
    
}

-(void)updata
{
    self.Blabel.text=[self.dataSource.data stringValue];
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
