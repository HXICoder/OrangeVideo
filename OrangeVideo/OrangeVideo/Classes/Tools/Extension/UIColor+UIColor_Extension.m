//
//  UIColor+UIColor_Extension.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "UIColor+UIColor_Extension.h"

@implementation UIColor (UIColor_Extension)

+ (UIColor *)colorWithRGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    return [UIColor colorWithRGB:r / 255.0 g:g / 255.0 b:b / 255.0 alpha:alpha];
}

@end
