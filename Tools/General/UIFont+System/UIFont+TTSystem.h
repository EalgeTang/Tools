//
//  UIFont+TTSystem.h
//  Tools
//
//  Created by tangbowen on 2018/7/2.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TTSystem)

+ (UIFont *)tt_systemFontWithSize:(CGFloat)size;

+ (UIFont *)tt_systemMediumFontWithSize:(CGFloat)size;

+ (UIFont *)tt_systemUltralightFontWithSize:(CGFloat)size;

+ (UIFont *)tt_systemSemiboldFontWithSize:(CGFloat)size;

+ (UIFont *)tt_systemThinFontWithSize:(CGFloat)size;

+ (UIFont *)tt_systemLightFontWithSize:(CGFloat)size;
@end
