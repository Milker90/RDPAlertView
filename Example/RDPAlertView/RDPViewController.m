//
//  RDPViewController.m
//  RDPAlertView
//
//  Created by TommyLiu on 01/29/2016.
//  Copyright (c) 2016 TommyLiu. All rights reserved.
//

#import "RDPViewController.h"
#import "RDPAlertView.h"
#import "RDPAlertViewContentView.h"

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
    RDPAlertView *alertView = [RDPAlertView new];
    RDPAlertViewContentView *contentView = [RDPAlertViewContentView new];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *additionalValues,  NSInteger buttonIndex) {
        NSLog(@"%@", @(buttonIndex));
    };
    [alertView setupAlertViewContentView:contentView];
    [alertView show];
}

@end
