//
//  ViewController.m
//  0802架构学习
//
//  Created by 区块国际－yin on 16/8/2.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//

#import "ViewController.h"
#import "YYGDataSoource.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Alabel;
@property(strong,nonatomic) YYGDataSoource * dataSource;

@end

@implementation ViewController
-(void)awakeFromNib
{
    self.dataSource=[YYGDataSoource new];
    //设置观察者
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
    [self updataLabel];
    
}

-(void)updataLabel
{
    self.Alabel.text=[self.dataSource.data stringValue];
}


#pragma mark Class Notification
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self.dataSource && [keyPath isEqualToString:@"data"])
    {
        [self updataLabel];
    }
}

@end
