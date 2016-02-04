# RDPAlertView

[![CI Status](http://img.shields.io/travis/Milker90/RDPAlertView.svg?style=flat)](https://travis-ci.org/Milker90/RDPAlertView)
[![Version](https://img.shields.io/cocoapods/v/RDPAlertView.svg?style=flat)](http://cocoapods.org/pods/RDPAlertView)
[![License](https://img.shields.io/cocoapods/l/RDPAlertView.svg?style=flat)](http://cocoapods.org/pods/RDPAlertView)
[![Platform](https://img.shields.io/cocoapods/p/RDPAlertView.svg?style=flat)](http://cocoapods.org/pods/RDPAlertView)

## Usage

 1，创建contentView<br>
 
```
RDPCustomAlertViewContentView *contentView = [RDPCustomAlertViewContentView newCustomAlertViewContentView:@"提示" message:@"这是一个全新的alertView，欢迎使用它。" buttonTitles:@"好的", @"谢谢", nil];
    contentView.reslutBlock = ^(RDPAlertView * alertView, NSDictionary *additionalValues,  NSInteger buttonIndex) {
        NSLog(@"%@", @(buttonIndex));
    };
```
    
 2，创建一个alertView，并配置它的contentView，也可以配置alertView的动画<br>
 
```
RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView];
    RDPAlertView *alertView = [RDPAlertView newRDPAlertViewWithContentView:contentView alertViewAnimation:alertViewAnimation];
```
    
 3， 显示alertView<br>
 
```
[alertView show];
```

## Installation

RDPAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RDPAlertView"
```