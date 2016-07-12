//
//  ViewController.m
//  WJProgress
//
//  Created by HuayuNanyan on 16/7/7.
//  Copyright © 2016年 HuayuNanyan. All rights reserved.
//

#import "ViewController.h"
#import "WJProgressView.h"

@interface ViewController ()
@property(strong,nonatomic)NSTimer *timer;
@property(strong,nonatomic)WJProgressView *progress1;
@property(strong,nonatomic)WJProgressView *progress2;
@property(strong,nonatomic)WJProgressView *progress3;
@property(strong,nonatomic)WJProgressView *progress4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progress1 = [[WJProgressView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    self.progress1.direction = WJProgressDirectionCounterClockwise;
    self.progress1.startPosition = WJProgressStartPositionTop;
    self.progress1.progress = 0.0;
    [self.view addSubview:self.progress1];
    
    self.progress2 = [[WJProgressView alloc]initWithFrame:CGRectMake(200, 50, 200, 200)];
    self.progress2.ringColor = [UIColor orangeColor];
    self.progress2.centerColor = [UIColor cyanColor];
    self.progress2.progress = 0.0;
    self.progress2.ringWidth = 20;
    self.progress2.startPosition = WJProgressStartPositionBottom;
    [self.view addSubview:self.progress2];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
}

-(void)changeProgress{
    
    self.progress1.progress += 0.01;
    self.progress2.progress += 0.01;
    if (self.progress2.progress >= 1.0) {
        [self.timer invalidate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end







