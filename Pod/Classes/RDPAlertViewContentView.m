//
//  RDPAlertViewContentView.m
//  Pods
//
//  Created by Allan Liu on 16/1/29.
//
//

#import "RDPAlertViewContentView.h"
#import "RDPAlertView.h"

@implementation RDPAlertViewContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, [self rdpContentViewWidth], [self rdpContentViewHeight]);
        [self configUI];
    }
    return self;
}

- (void)configUI {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 4.0f;
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60, 80, 80, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)close {
    __weak typeof(self)weakSelf = self;
    [_alertView hide:^(BOOL finished) {
        if (finished) {
            if (weakSelf.reslutBlock) {
                weakSelf.reslutBlock(nil, nil, 1);
            }
            
        }
    }];
}

#pragma mark
#pragma mark - 配置大小
- (CGFloat)rdpContentViewHeight {
    return 270.0f;
}

- (CGFloat)rdpContentViewWidth {
    return 270.0f;
}

@end