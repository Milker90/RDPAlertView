//
//  RDPCustomAlertViewContentView0.h
//  RDPAlertView
//
//  Created by Milker90 on 16/2/3.
//  Copyright © 2016年 Milker90. All rights reserved.
//

#import <RDPAlertView/RDPAlertView.h>

@interface RDPCustomAlertViewContentView0 : RDPAlertViewContentView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSArray *buttonTitles;

+ (RDPCustomAlertViewContentView0 *)newCustomAlertViewContentView:(NSString *)title
                                                         message:(NSString *)message
                                                    buttonTitles:(NSString *)buttonTitles, ...;

@end
