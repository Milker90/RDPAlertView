//
//  RDPAlertViewAnimation.h
//  Pods
//
//  Created by Milker90 on 16/1/29.
//
//

#import <Foundation/Foundation.h>

@interface RDPAlertViewAnimation : NSObject

@property (nonatomic, assign) BOOL isAnimating;

/**
 *  显示动画，可以通过继承覆盖修改
 *
 *  @param block 动画结束block, 动画完成后需要用此block回调
 */
- (void)showAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL finish))block;

/**
 *  隐藏动画，可以通过继承覆盖修改
 *
 *  @param block 动画结束block, 动画完成后需要用此block回调
 */
- (void)hideAnimation:(UIView *)backgroundView
          contentView:(UIView *)contentView
      animationDidEnd:(void (^)(BOOL finish))block;

@end
