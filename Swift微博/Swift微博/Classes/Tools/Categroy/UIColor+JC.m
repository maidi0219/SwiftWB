//
//  UIColor+JC.m
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

#import "UIColor+JC.h"

@implementation UIColor (JC)


+ (UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
}

+ (UIColor*) mColorForHex:(NSInteger)hexValue
{
    return [UIColor mColorForHex:hexValue alpha:1.0];
}

+ (UIColor*) mColorForHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0x00FF00) >> 8))/255.0
                            blue:((float)(hexValue & 0x0000FF))/255.0 alpha:alphaValue];
}
@end
