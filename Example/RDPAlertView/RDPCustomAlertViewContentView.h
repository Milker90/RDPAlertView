//
//  RDPCustomAlertViewContentView.h
//  RDPAlertView
//
//  Created by Allan Liu on 16/2/3.
//  Copyright © 2016年 TommyLiu. All rights reserved.
//

#import <RDPAlertView/RDPAlertView.h>

@interface RDPCustomAlertViewContentView : RDPAlertViewContentView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSArray *buttonTitles;

+ (RDPCustomAlertViewContentView *)newCustomAlertViewContentView:(NSString *)title
                                                         message:(NSString *)message
                                                    buttonTitles:(NSString *)buttonTitles, ...;

@end
