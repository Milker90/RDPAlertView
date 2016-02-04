//
//  RDPCustomAlertViewContentView1.h
//  RDPAlertView
//
//  Created by Allan Liu on 16/2/4.
//  Copyright © 2016年 TommyLiu. All rights reserved.
//

#import <RDPAlertView/RDPAlertView.h>

@interface RDPCustomAlertViewContentView1 : RDPAlertViewContentView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *buttonTitles;

+ (RDPCustomAlertViewContentView1 *)newCustomAlertViewContentView:(NSString *)title
                                                     buttonTitles:(NSString *)buttonTitles, ...;

@end
