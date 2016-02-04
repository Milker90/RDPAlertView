//
//  RDPViewController.m
//  RDPAlertView
//
//  Created by Milker90 on 01/29/2016.
//  Copyright (c) 2016 Milker90. All rights reserved.
//

#import "RDPViewController.h"
#import "View+MASAdditions.h"
#import "RDPAlertView.h"
#import "RDPCustomAlertViewContentView0.h"
#import "RDPCustomAlertViewContentView1.h"
#import "RDPAlertViewCustomAnimation.h"

@interface RDPViewController ()

@property (nonatomic, strong) NSArray *workArray;

@end

@implementation RDPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RDPAlertView";
    self.workArray = [NSArray arrayWithObjects:@"自定义AlertContentView0", @"自定义AlertContentView1", @"自定义Alert动画", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TestCell"];
}

- (void)showAlertContentView0 {
    // 1，创建contentView
    RDPCustomAlertViewContentView0 *contentView = [RDPCustomAlertViewContentView0 newCustomAlertViewContentView:@"提示" message:@"这是一个全新的alertView，欢迎使用它。" buttonTitles:@"好的", @"不了", nil];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *values,  NSInteger buttonIndex) {
        NSLog(@"buttonIndex:%@", @(buttonIndex));
    };
    
    // 2，创建一个alertView，并配置它的contentView
    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView];
    
    // 3， 显示alertView
    [alertView show];
}

- (void)showAlertContentView1 {
    // 1，创建contentView
    RDPCustomAlertViewContentView1 *contentView = [RDPCustomAlertViewContentView1 newCustomAlertViewContentView:@"提示" buttonTitles:@"确定", @"取消", nil];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *values,  NSInteger buttonIndex) {
        NSLog(@"buttonIndex:%@ values:%@", @(buttonIndex), values);
    };
    contentView.actionBlock = ^(RDPAlertView *alertView, NSDictionary *values, NSString *actionStr) {
        if ([actionStr isEqualToString:@"reset"]) {
            NSLog(@"action:%@", actionStr);
        }
    };
    
    // 2，创建一个alertView，并配置它的contentView
    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView];
    
    // 3， 显示alertView
    [alertView show];
}

- (void)showCustomAlertViewAnimation {
    // 1，创建contentView
    RDPCustomAlertViewContentView0 *contentView = [RDPCustomAlertViewContentView0 newCustomAlertViewContentView:@"提示" message:@"这是一个全新的alertView，欢迎使用它。" buttonTitles:@"好的", @"不了", nil];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *values,  NSInteger buttonIndex) {
        NSLog(@"buttonIndex:%@", @(buttonIndex));
    };
    
    // 2，创建自定义动画
    RDPAlertViewCustomAnimation *alertViewAnimation = [RDPAlertViewCustomAnimation new];
    
    // 3，创建一个alertView，并配置它的contentView，以及自定义动画
    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView alertViewAnimation:alertViewAnimation];
    
    // 4， 显示alertView
    [alertView show];
}

#pragma mark
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _workArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"TestCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [_workArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark
#pragma mark - UITableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self showAlertContentView0];
    } else if (indexPath.row == 1) {
        [self showAlertContentView1];
    } else if (indexPath.row == 2) {
        [self showCustomAlertViewAnimation];
    }
}

@end
