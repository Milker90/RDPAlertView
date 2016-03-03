//
//  RDPAlertViewCustomAnimation.m
//  RDPAlertView
//
//  Created by Milker90 on 16/2/4.
//  Copyright © 2016年 Milker90. All rights reserved.
//

#import "RDPAlertViewCustomAnimation.h"
#import "POP.h"

@implementation RDPAlertViewCustomAnimation

- (void)showAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL finish))block {
    // 覆盖此方法，实现backgroundView和contentView的动画
    if (!backgroundView || !contentView) {
        return;
    }
    
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [backgroundView pop_removeAllAnimations];
    contentView.alpha = 0.0f;
    [contentView pop_removeAllAnimations];
  
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    scaleAnimation.springBounciness = 10.f;
    
    POPBasicAnimation *alphaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAnimation.toValue = @(1);
    
    [contentView pop_addAnimation:alphaAnimation forKey:@"alphaAnimation"];
    [contentView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    POPBasicAnimation *backgroundAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    backgroundAnimation.toValue = HEXACOLOR(0x000810, 0.78);
    __weak typeof(self)weakSelf = self;
    [backgroundAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            weakSelf.isAnimating = NO;
            block(YES);
        }
    }];
    [backgroundView pop_addAnimation:backgroundAnimation forKey:@"backgroundAnimation"];
}

- (void)hideAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL))block {
    // 覆盖此方法，实现backgroundView和contentView的动画
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    
    [contentView pop_removeAllAnimations];
    POPBasicAnimation *scale2Animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scale2Animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    scale2Animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.9, 0.9)];
    scale2Animation.duration = 0.15;
    [contentView pop_addAnimation:scale2Animation forKey:@"scale2Animation"];
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.08, 1.08)];
    scaleAnimation.duration = 0.2;
    scaleAnimation.beginTime = CACurrentMediaTime() + 0.15;
    [contentView pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    POPBasicAnimation *scale1Animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scale1Animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
    scale1Animation.beginTime = CACurrentMediaTime() + 0.35;
    scale1Animation.duration = 0.4;
    [contentView pop_addAnimation:scale1Animation forKey:@"scale1Animation"];
    
    POPBasicAnimation *alphaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAnimation.toValue = @(0);
    alphaAnimation.duration = 0.4;
    alphaAnimation.beginTime = CACurrentMediaTime() + 0.35;
    [contentView pop_addAnimation:alphaAnimation forKey:@"alphaAnimation"];
    
    POPBasicAnimation *backgroundAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    backgroundAnimation.toValue = [UIColor clearColor];
    backgroundAnimation.duration = 0.4;
    backgroundAnimation.beginTime = CACurrentMediaTime() + 0.35;
    __weak typeof(self)weakSelf = self;
    [backgroundAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            weakSelf.isAnimating = NO;
            block(YES);
        }
    }];
    [backgroundView pop_addAnimation:backgroundAnimation forKey:@"backgroundAnimation"];
}

@end
