//
//  RDPAlertView.m
//  Pods
//
//  Created by Allan Liu on 16/1/29.
//
//

#import "RDPAlertView.h"

@implementation RDPAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _backgroundView = [UIView new];
        _backgroundView.frame = self.bounds;
        [self addSubview:_backgroundView];
    }
    return self;
}

- (void)setupAlertViewContentView:(RDPAlertViewContentView *)alertViewContentView {
    [self setupAlertViewContentView:alertViewContentView alertViewAnimation:nil];
}

- (void)setupAlertViewContentView:(RDPAlertViewContentView *)alertViewContentView alertViewAnimation:(RDPAlertViewAnimation *)alertViewAnimation {
    if (!alertViewContentView) {
        NSLog(@"alertViewContentView should not nil");
        return;
    }
    
    if (_alertViewContentView) {
        [_alertViewContentView removeFromSuperview];
        _alertViewContentView = nil;
    }
    
    alertViewContentView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    alertViewContentView.alertView = self;
    [self addSubview:alertViewContentView];
    self.alertViewContentView = alertViewContentView;
    
    if (!_alertViewAnimation) {
        _alertViewAnimation = [RDPAlertViewAnimation new];
    } else {
        _alertViewAnimation = alertViewAnimation;
    }
}

#pragma mark
#pragma mark - 显示和隐藏
- (void)show {
    [self show:nil];
}

- (void)show:(void(^)(BOOL finished))block {
    if (!_alertViewAnimation.isAnimating) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        [window addSubview:self];
        
        [_alertViewAnimation showAnimation:_backgroundView contentView:_alertViewContentView animationDidEnd:^(BOOL finish) {
            if (finish) {
                if (block) {
                    block(YES);
                }
            }
        }];
    } else {
        NSLog(@"alertView is animating");
    }
}

- (void)hide {
    [self hide:nil];
}

- (void)hide:(void(^)(BOOL finished))block {
    if (!_alertViewAnimation.isAnimating) {
        __weak typeof(self)weakSelf = self;
        [_alertViewAnimation hideAnimation:_backgroundView contentView:_alertViewContentView animationDidEnd:^(BOOL finish) {
            if (finish) {
                if (block) {
                    [weakSelf removeFromSuperview];
                    block(YES);
                }
            }
        }];
    } else {
        NSLog(@"alertView is animating");
    }
}

@end
