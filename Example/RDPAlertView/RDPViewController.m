//
//  RDPViewController.m
//  RDPAlertView
//
//  Created by Milker90 on 01/29/2016.
//  Copyright (c) 2016 Milker90. All rights reserved.
//

#import "RDPViewController.h"
#import "RDPAlertView.h"
#import "RDPCustomAlertViewContentView.h"

@interface RDPViewController ()

@end

@implementation RDPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"Show" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)show {
    
    // 1，创建contentView
    RDPCustomAlertViewContentView *contentView = [RDPCustomAlertViewContentView newCustomAlertViewContentView:@"提示" message:@"这是一个全新的alertView，欢迎使用它。" buttonTitles:@"好的", @"不了", nil];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *additionalValues,  NSInteger buttonIndex) {
        NSLog(@"%@", @(buttonIndex));
    };
    
    // 2，创建一个alertView，并配置它的contentView，也可以配置alertView的动画
    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView];
//    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView alertViewAnimation:alertViewAnimation];
    
    // 3， 显示alertView
    [alertView show];
}

@end
