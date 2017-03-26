//
//  UIImageView+CornerRadius.m
//  Swift微博
//
//  Created by LXL on 2016/12/4.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

#import "UIImageView+CornerRadius.h"

@implementation UIImageView (CornerRadius)
- (void)setRoundedCornersSize:(CGFloat)cornersSize {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                        cornerRadius:cornersSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}
@end
