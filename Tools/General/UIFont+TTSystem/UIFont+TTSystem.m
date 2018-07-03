//
//  UIFont+TTSystem.m
//  Tools
//
//  Created by tangbowen on 2018/7/2.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "UIFont+TTSystem.h"

@implementation UIFont (TTSystem)

+ (UIFont *)tt_systemFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)tt_systemMediumFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Medium" size:size];
}

+ (UIFont *)tt_systemUltralightFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Ultralight" size:size];
}

+ (UIFont *)tt_systemSemiboldFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Semibold" size:size];
}

+ (UIFont *)tt_systemThinFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Thin" size:size];
}

+ (UIFont *)tt_systemLightFontWithSize:(CGFloat)size
{
    return [self tt_systemFontWithName:@"PingFangSC-Light" size:size];
}

+ (UIFont *)tt_systemFontWithName:(NSString *)fontName size:(CGFloat)size
{
    if (tk_iOS_9_Above)
    {
        return [UIFont fontWithName:fontName size:size];
    }
    return [UIFont systemFontOfSize:size];
}

@end
