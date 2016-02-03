//
//  UIImage+RDPExtension.m
//  Pods
//
//  Created by whj on 15/5/25.
//
//

#import "UIImage+RDPExtension.h"

@implementation UIImage (RDPExtension)

+ (UIImage *)imgForColor:(UIColor *)color {
    if (!color) {
        return nil;
    }
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [theImage stretchableImageWithLeftCapWidth:0.5f topCapHeight:0.5f];
}

- (UIImage *)stretchImg {
    return [self stretchableImageWithLeftCapWidth:floorf(self.size.width / 2.f) topCapHeight:floorf(self.size.height / 2.f)];
}


+ (UIImage *)imgWithColor:(UIColor *)color
               rectCorner:(UIRectCorner)rectCorner
                   bounds:(CGRect)bounds
              cornerRadii:(CGSize)cornerRadii {
    if (!color) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                     byRoundingCorners:rectCorner
                                                           cornerRadii:cornerRadii];
    [color setFill];
    [bezierPath fill];
    
    CGContextAddPath(context, bezierPath.CGPath);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
