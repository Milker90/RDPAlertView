//
//  RDPCustomAlertViewContentView.m
//  RDPAlertView
//
//  Created by Allan Liu on 16/2/3.
//  Copyright © 2016年 TommyLiu. All rights reserved.
//

#import "RDPCustomAlertViewContentView.h"
#import "View+MASAdditions.h"
#import "UIImage+RDPExtension.h"

// 16进制颜色
#define HEXCOLOR(rgbValue) HEXACOLOR(rgbValue, 1.f)
#define HEXACOLOR(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@interface RDPCustomAlertViewContentView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation RDPCustomAlertViewContentView

+ (RDPCustomAlertViewContentView *)newCustomAlertViewContentView:(NSString *)title
                                                         message:(NSString *)message
                                                    buttonTitles:(NSString *)buttonTitles, ... {
    RDPCustomAlertViewContentView *contentView = [[RDPCustomAlertViewContentView alloc] initWithFrame:CGRectZero];
    contentView.title = title;
    contentView.message = message;
    
    NSMutableArray *arr = [NSMutableArray array];
    va_list buttonTitleList;
    va_start(buttonTitleList, buttonTitles);
    for (NSString *buttonTitle = buttonTitles; buttonTitle != nil; buttonTitle = va_arg(buttonTitleList, NSString *)) {
        [arr addObject:buttonTitle];
    }
    va_end(buttonTitleList);
    contentView.buttonTitles = arr;
    [contentView configUI];
    
    return contentView;
}

- (void)configUI {
    // 覆盖此方法来布局不同的contentView
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 4.0f;
    self.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"alert_tip_icon"];
    _iconImageView = [UIImageView new];
    _iconImageView.image = image;
    [self addSubview:_iconImageView];
    CGSize size = image.size;
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(30);
        make.size.mas_equalTo(size);
    }];
    
    // 标题
    _titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textColor = HEXCOLOR(0x4783c6);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    _titleLabel.text = _title;
    [self addSubview:_titleLabel];
    _titleLabel.frame = CGRectMake(0, 0, 220, MAXFLOAT);
    [_titleLabel sizeToFit];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(25);
        make.size.mas_equalTo(_titleLabel.frame.size);
    }];
    
    // 副标题
    _messageLabel = [UILabel new];
    _messageLabel.font = [UIFont systemFontOfSize:13.0f];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.numberOfLines = 0;
    _messageLabel.text = _message;
    _messageLabel.textColor = HEXCOLOR(0x4783c6);
    [self addSubview:_messageLabel];
    _messageLabel.frame = CGRectMake(0, 0, 200, MAXFLOAT);
    [_messageLabel sizeToFit];
    [_messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(_messageLabel.frame.size);
    }];
    
    // 底部按钮
    UIButton *buttonBackground = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor *bgColor = HEXCOLOR(0xf2f2f8);
    UIImage *bimage = [UIImage imgForColor:bgColor];
    [buttonBackground setBackgroundImage:bimage forState:UIControlStateNormal];
    [buttonBackground setBackgroundImage:bimage forState:UIControlStateHighlighted];
    [self addSubview:buttonBackground];
    [buttonBackground mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.height.mas_equalTo(44);
    }];
    
    CGFloat left = 0.0f;
    CGFloat buttonWidth = (270 - 0.5 *(self.buttonTitles.count - 1))/self.buttonTitles.count;
    for (NSInteger i = 0; i < self.buttonTitles.count; i++) {
        NSString *buttonTitle = [self.buttonTitles objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.clipsToBounds = YES;
        button.tag = 10000 + i;
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x4783c6) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(left);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(44);
        }];
        
        if (i != self.buttonTitles.count - 1) {
            UIView *line = [UIView new];
            line.backgroundColor = HEXCOLOR(0xe9e9f4);
            line.tag = 20000 + i;
            [self addSubview:line];
            [line mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(button.mas_right);
                make.bottom.mas_equalTo(self.mas_bottom);
                make.width.mas_equalTo(0.5);
                make.height.mas_equalTo(44);
            }];
            left += buttonWidth + 0.5;
        } else {
            left += buttonWidth;
        }
        
        if (i == 0) {
            if (self.buttonTitles.count == 1) {
                UIImage *image = [UIImage imgForColor:[UIColor clearColor]];
                UIImage *himage = [UIImage imgForColor:HEXCOLOR(0xe9e9f4)];
                [button setBackgroundImage:image forState:UIControlStateNormal];
                [button setBackgroundImage:himage forState:UIControlStateHighlighted];
            } else {
                UIImage *image = [UIImage imgForColor:[UIColor clearColor]];
                UIImage *himage = [UIImage imgForColor:HEXCOLOR(0xe9e9f4)];
                [button setBackgroundImage:image forState:UIControlStateNormal];
                [button setBackgroundImage:himage forState:UIControlStateHighlighted];
            }
        } else if (i == self.buttonTitles.count - 1) {
            UIImage *image = [UIImage imgForColor:[UIColor clearColor]];
            UIImage *himage = [UIImage imgForColor:HEXCOLOR(0xe9e9f4)];
            [button setBackgroundImage:image forState:UIControlStateNormal];
            [button setBackgroundImage:himage forState:UIControlStateHighlighted];
        }
    }
}

- (void)buttonAction:(UIButton *)button {
    [self hideWithAdditionalValues:nil buttonIndex:button.tag - 10000];
}

@end
