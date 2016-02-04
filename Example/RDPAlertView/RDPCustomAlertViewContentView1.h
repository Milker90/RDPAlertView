//
//  RDPCustomAlertViewContentView1.h
//  RDPAlertView
//
//  Created by Milker90 on 16/2/4.
//  Copyright © 2016年 Milker90. All rights reserved.
//

#import <RDPAlertView/RDPAlertView.h>

@interface RDPCustomAlertViewContentView1 : RDPAlertViewContentView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *buttonTitles;

+ (RDPCustomAlertViewContentView1 *)newCustomAlertViewContentView:(NSString *)title
                                                     buttonTitles:(NSString *)buttonTitles, ...;

@end
