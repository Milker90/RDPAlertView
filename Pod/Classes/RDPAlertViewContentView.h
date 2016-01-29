//
//  RDPAlertViewContentView.h
//  Pods
//
//  Created by Allan Liu on 16/1/29.
//
//

#import <UIKit/UIKit.h>
@class RDPAlertView;

/**
 *  操作完成block
 *
 *  @param alertView        alertView
 *  @param additionalValues alertView界面上的数据
 *  @param buttonIndex      选择的按钮索引
 */
typedef void (^RDPAlertViewResultBlock)(RDPAlertView * alertView, NSDictionary *additionalValues,  NSInteger buttonIndex);

/**
 *  和alertView交互的block
 *
 *  @param alertView        alertView
 *  @param additionalValues 交互数据
 *  @param actionStr        交互字符串
 */
typedef void (^RDPAlertViewActionBlock)(RDPAlertView * alertView, NSDictionary *additionalValues, NSString * actionStr);

@interface RDPAlertViewContentView : UIView

@property (nonatomic, weak) RDPAlertView *alertView;

@property (nonatomic, copy) RDPAlertViewResultBlock reslutBlock;
@property (nonatomic, copy) RDPAlertViewActionBlock actionBlock;

/**
 *  覆盖此方法，来实现不同的contentView
 */
- (void)configUI;

/**
 *  需注意最大高度，最大高度根据不同的设备设置，使用者自己考虑
 *  大于最大高度的应该使用scrollview或tableview来展示
 */
- (CGFloat)rdpContentViewHeight;

/**
 *  一般不需要设置，自定义可能要用到
 */
- (CGFloat)rdpContentViewWidth;

@end
