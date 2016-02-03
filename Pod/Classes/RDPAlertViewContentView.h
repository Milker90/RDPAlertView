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

@property (nonatomic, strong) id data;

@property (nonatomic, weak) RDPAlertView *alertView;

@property (nonatomic, copy) RDPAlertViewResultBlock reslutBlock;
@property (nonatomic, copy) RDPAlertViewActionBlock actionBlock;

/**
 *  覆盖此方法，来实现不同的contentView
 */
- (void)configUI;

/**
 *  隐藏alertView
 *
 *  @param additionalValues 需要传出去的数据
 *  @param buttonIndex      当前选择的按钮索引
 */
- (void)hideWithAdditionalValues:(NSDictionary *)additionalValues
                     buttonIndex:(NSInteger)buttonIndex;

@end
