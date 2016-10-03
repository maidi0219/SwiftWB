//
//  UIColor+JC.m
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

#import "UIColor+JC.h"

@implementation UIColor (JC)


+(UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.5];
}
@end
