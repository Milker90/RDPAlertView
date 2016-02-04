//
//  RDPAlertViewContentView.m
//  Pods
//
//  Created by Milker90 on 16/1/29.
//
//

#import "RDPAlertViewContentView.h"
#import "RDPAlertView.h"

@implementation RDPAlertViewContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (CGRectEqualToRect(frame, CGRectZero)) {
            self.frame = CGRectMake(0, 0, 270.0f, 270.0f);
        }
        self.values = [NSMutableDictionary dictionary];        
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

- (void)hideWithValues:(NSDictionary *)values
           buttonIndex:(NSInteger)buttonIndex {
    __weak typeof(self)weakSelf = self;
    [_alertView hide:^(BOOL finished) {
        if (finished) {
            if (weakSelf.reslutBlock) {
                weakSelf.reslutBlock(weakSelf.alertView, values, buttonIndex);
            }            
        }
    }];
}

- (void)sendActionWithValues:(NSDictionary *)values
                actionString:(NSString *)actionString {
    if (self.actionBlock) {
        self.actionBlock(self.alertView, values, actionString);
    }
}

@end
