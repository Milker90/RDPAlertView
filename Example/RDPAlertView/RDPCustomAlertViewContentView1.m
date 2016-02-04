//
//  RDPCustomAlertViewContentView1.m
//  RDPAlertView
//
//  Created by Allan Liu on 16/2/4.
//  Copyright © 2016年 TommyLiu. All rights reserved.
//

#import "RDPCustomAlertViewContentView1.h"
#import "View+MASAdditions.h"
#import "UIImage+RDPExtension.h"

@interface RDPCustomAlertViewContentView1 ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *contentTextField;

@end

@implementation RDPCustomAlertViewContentView1

+ (RDPCustomAlertViewContentView1 *)newCustomAlertViewContentView:(NSString *)title
                                                     buttonTitles:(NSString *)buttonTitles, ... {
    RDPCustomAlertViewContentView1 *contentView = [[RDPCustomAlertViewContentView1 alloc] initWithFrame:CGRectZero];
    contentView.title = title;
    
    NSMutableArray *arr = [NSMutableArray array];
    va_list buttonTitleList;
    va_start(buttonTitleList, buttonTitles);
    for (NSString *buttonTitle = buttonTitles; buttonTitle != nil; buttonTitle = va_arg(buttonTitleList, NSString *)) {
        [arr addObject:buttonTitle];
    }
    va_end(buttonTitleList);
    contentView.buttonTitles = arr;
    
    [contentView registerKeyboardListener];
    [contentView configUI];
    
    return contentView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)configUI {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 4.0f;
    self.backgroundColor = [UIColor whiteColor];
    
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
        make.top.mas_equalTo(self.mas_top).offset(25);
        make.size.mas_equalTo(_titleLabel.frame.size);
    }];
    
    // 输入框
    _contentTextField = [UITextField new];
    _contentTextField.borderStyle = UITextBorderStyleRoundedRect;
    _contentTextField.font = [UIFont systemFontOfSize:13.0f];
    _contentTextField.placeholder = @"请输入内容";
    _contentTextField.textColor = HEXCOLOR(0x4783c6);
    [self addSubview:_contentTextField];
    [_contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
    
    // 重置按钮
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(resetAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:resetButton];
    [resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(_contentTextField.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
    
    // 底部按钮
    UIButton *buttonBackground = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor *bgColor = HEXCOLOR(0xf2f2f8);
    UIImage *bimage = [UIImage imgForColor:bgColor];
    [buttonBackground setBackgroundImage:bimage forState:UIControlStateNormal];
    [buttonBackground setBackgroundImage:bimage forState:UIControlStateHighlighted];
    [self addSubview:buttonBackground];
    [buttonBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.height.mas_equalTo(44);
    }];
    
    CGFloat left = 0;
    CGFloat buttonWidth = (270 - 0.5 *(self.buttonTitles.count - 1))/self.buttonTitles.count;
    for (NSInteger i = 0; i < self.buttonTitles.count; i++) {
        NSString *buttonTitle = [self.buttonTitles objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.clipsToBounds = YES;
        button.tag = 10000 + i;
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x4783c6) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (void)resetAction {
    [self sendActionWithValues:nil actionString:@"reset"];
}

- (void)buttonAction:(UIButton *)button {
    if (_contentTextField.text) {
        [self.values setObject:_contentTextField.text forKey:@"inputValue"];
    }
    [self hideWithValues:self.values buttonIndex:button.tag - 10000];
}

#pragma mark
#pragma mark - keyboard
- (void)registerKeyboardListener {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)keyboardWillShow:(NSNotification *)notif {
    if (self.hidden == YES) {
        return;
    }
    
    CGRect rect = [[notif.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect frame = self.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height - frame.size.height;
    self.frame = frame;
}

- (void)keyboardWillHide:(NSNotification *)notif {
    if (self.hidden == YES) {
        return;
    }
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.center = CGPointMake(size.width/2, size.height/2);
}


@end
