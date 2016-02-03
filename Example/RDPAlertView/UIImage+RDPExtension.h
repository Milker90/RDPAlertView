//
//  UIImage+RDPExtension.h
//  Pods
//
//  Created by whj on 15/5/25.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (RDPExtension)

+ (UIImage *)imgForColor:(UIColor *)color;
- (UIImage *)stretchImg;

+ (UIImage *)imgWithColor:(UIColor *)color
               rectCorner:(UIRectCorner)rectCorner
                   bounds:(CGRect)bounds
              cornerRadii:(CGSize)cornerRadii;

@end
