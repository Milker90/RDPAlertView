//
//  RDPAlertViewAnimation.m
//  Pods
//
//  Created by Milker90 on 16/1/29.
//
//

#import "RDPAlertViewAnimation.h"

@interface RDPAlertViewAnimation ()

@end

@implementation RDPAlertViewAnimation

- (void)showAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL finish))block {
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;
    
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    contentView.layer.transform = CATransform3DMakeScale(1.1f, 1.1f, 1.0);
    contentView.alpha = 0.0f;
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.25f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.78];
                         contentView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                         contentView.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         if (finished) {
                             weakSelf.isAnimating = NO;
                             block(YES);
                         }
                     }];
}

- (void)hideAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL finish))block {    
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.15f animations:^{
        contentView.alpha = 0.0f;
        backgroundView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            weakSelf.isAnimating = NO;
            block(YES);
        }
    }];
}

@end
