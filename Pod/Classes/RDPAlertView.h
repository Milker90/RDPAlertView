//
//  RDPAlertView.h
//  Pods
//
//  Created by Allan Liu on 16/1/29.
//
//

#import <UIKit/UIKit.h>
#import "RDPAlertViewContentView.h"
#import "RDPAlertViewAnimation.h"

@interface RDPAlertView : UIView

/**
 *  alertView的背景
 */
@property (nonatomic, strong) UIView *backgroundView;

/**
 *  alertView的内容界面
 */
@property (nonatomic, strong) RDPAlertViewContentView *alertViewContentView;


/**
 *  alertView的动画对象
 */
@property (nonatomic, strong) RDPAlertViewAnimation *alertViewAnimation;

/**
 *  setup alertView content view and use default animation
 *
 *  @param contentView custom content view
 */
- (void)setupAlertViewContentView:(RDPAlertViewContentView *)alertViewContentView;

/**
 *  setup alertView content view and animation
 *
 *  @param alertViewContentView custom content view
 *  @param alertViewAnimation   custom animation
 */
- (void)setupAlertViewContentView:(RDPAlertViewContentView *)alertViewContentView alertViewAnimation:(RDPAlertViewAnimation *)alertViewAnimation;

- (void)show;
- (void)show:(void(^)(BOOL finished))block;
- (void)hide;
- (void)hide:(void(^)(BOOL finished))block;

@end
