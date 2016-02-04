//
//  RDPAlertViewContentView.h
//  Pods
//
//  Created by Milker90 on 16/1/29.
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
typedef void (^RDPAlertViewResultBlock)(RDPAlertView * alertView, NSDictionary *values,  NSInteger buttonIndex);

/**
 *  和alertView交互的block
 *
 *  @param alertView        alertView
 *  @param additionalValues 交互数据
 *  @param actionStr        交互字符串
 */
typedef void (^RDPAlertViewActionBlock)(RDPAlertView * alertView, NSDictionary *values, NSString * actionStr);

@interface RDPAlertViewContentView : UIView

@property (nonatomic, strong) NSMutableDictionary *values;

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
- (void)hideWithValues:(NSDictionary *)values
           buttonIndex:(NSInteger)buttonIndex;

/**
 *  alertView上的交互操作
 *
 *  @param values       需要传出去的数据
 *  @param actionString 自定义的action类型
 */
- (void)sendActionWithValues:(NSDictionary *)values
                actionString:(NSString *)actionString;

@end
