//
//  UIColor+JC.h
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JC)

+ (UIColor *)randomColor;
+ (UIColor*) mColorForHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) mColorForHex:(NSInteger)hexValue;

@end
