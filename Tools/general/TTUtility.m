//
//  TTUtility.m
//  Tools
//
//  Created by tangbowen on 2018/5/30.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTUtility.h"
#import <objc/runtime.h>
#import <sys/utsname.h>
@implementation TTUtility

/** 获取windows当前现在的Vc*/
+ (UIViewController *)tt_getCurrentViewController
{
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (1) {
         //
        if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController)
        {
            vc = vc.presentedViewController;
        }
        else
        {
            break;
        }
    }
    
    return vc;
}

/**
 验证E-mail 格式
 @param email 需要验证的emal格式
 @return 格式是否正确
 */
+ (BOOL)tt_validateEmail:(NSString *)email
{
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
    return [predicate evaluateWithObject:email];
}

/**
 验证中文
 */
+ (BOOL)tt_validateChinese:(NSString *)str;
{
    NSString *reg = @"[\u4e00-\u9fa5]";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reg];
    return [predicate evaluateWithObject:str];
}

+ (BOOL)tt_validateRegExForPredicate:(NSString *)reg string:(NSString *)str
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reg];
    return [predicate evaluateWithObject:str];
}

/**设备型号*/
+ (NSString *)tt_deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    // 中间这段内容视情况而定, 可以省略掉..
    //    if ([deviceString hasPrefix:@"iPhone3"])    return @"iPhone 4";
    //    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    //    if ([deviceString isEqualToString:@"iPhone5,1"]||[deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    //    if ([deviceString isEqualToString:@"iPhone5,3"]||[deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    //    if ([deviceString hasPrefix:@"iPhone6"])    return @"iPhone 5S";
    //    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    //    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    //    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    //    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    return deviceString;
}

/**APP的icon*/
+ (UIImage *)tt_appIcon
{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSArray *arr = [infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"];
    NSString *icon = [arr lastObject];
    UIImage *image = [UIImage imageNamed:icon];
    if (image == nil)
    {
        icon = [arr firstObject];
        image = [UIImage imageNamed:icon];
    }
    return image;
}

/**app的名字*/
+ (NSString *)tt_appName
{
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSString *name = dict[@"CFBundleDisplayName"];
    if (name == nil)
    {
        name = dict[@"CFBundleName"];
    }
    return name?:@"";
}

@end

@implementation NSObject (TTUtility)

- (NSString *)tt_className
{
    return NSStringFromClass([self class]);
}

- (NSString *)tt_superClassName
{
    return NSStringFromClass([self superclass]);
}

+ (NSString *)tt_className
{
    return NSStringFromClass([self class]);
}

+ (NSString *)tt_superClassName
{
    return NSStringFromClass([self superclass]);
}

@end
@implementation NSArray (TTUtility)

- (BOOL)tt_isUseable
{
    return ([self isKindOfClass:[NSArray class]] && self.count > 0);
}
@end

@implementation  NSDictionary (TTUtility)

- (BOOL)tt_isUseable
{
    return ([self isKindOfClass:[NSDictionary class]] && self.count > 0);
}

- (id)getAttribute:(NSString *)attribute
{
    id obj = [self objectForKey:attribute];
    return (obj == [NSNull null] ? @"" : obj);
}

- (int)tt_intAttribute:(NSString *)attribute defaultValue:(int)defaultValue
{
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value intValue];
    }
    
    return defaultValue;
}

- (NSInteger)tt_integerAttribute:(NSString *)attribute defaultValue:(NSInteger)defaultValue
{
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value integerValue];
    }
    return defaultValue;
}

- (float)tt_floatAttribute:(NSString *)attribute defaultValue:(float)defaultValue
{
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value floatValue];
    }
    return defaultValue;
}

- (BOOL)tt_boolAttribute:(NSString *)attribute defaultValue:(BOOL)defalutValue
{
    NSString *value = [self getAttribute:attribute];
    if (value) {
        return [value boolValue];
    }
    return defalutValue;
}

- (NSString *)tt_stringAttributeIncludeNil:(NSString *)attribute
{
    id object = [self objectForKey:attribute];
    if (object == nil)
    {
        return nil;
    }
    if ([object isKindOfClass:[NSString class]])
    {
        return object;
    }
    if ([object isKindOfClass:[NSNumber class]])
    {
        NSNumber *num = (NSNumber *)object;
        NSString *str = [num stringValue];
        return str;
    }
    if ([object isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    
    return object;
}

- (NSString *)tt_stringAttribute:(NSString *)attribute
{
    id object = [self objectForKey:attribute];
    if (object == nil)
    {
        return @"";
    }
    if ([object isKindOfClass:[NSString class]])
    {
        return object;
    }
    if ([object isKindOfClass:[NSNumber class]])
    {
        NSNumber *num = (NSNumber *)object;
        NSString *str = [num stringValue];
        return str;
    }
    if ([object isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    
    return object;
}

- (NSArray *)tt_arrayAttribute:(NSString *)attribute
{
    if (attribute == nil)
    {
        return nil;
    }
    id object = [self objectForKey:attribute];
    if ([object isKindOfClass:[NSArray class]])
    {
        return object;
    }
    return nil;
}

@end

@implementation NSData (TTUtility)

@end

@implementation NSString (TTUtility)

- (BOOL)tt_isUseable
{
    return ([self isKindOfClass:[NSString class]] && self.length>0);
}

/**判断是否包含 字符串 aString*/
- (BOOL)tt_containString:(NSString *)aString {
    BOOL isContain = NO;
    
    if([aString isKindOfClass:[NSString class]]) {
        isContain = [self containsString:aString];
    }
    
    return isContain;
}

/**从from位置截取字符串*/
- (NSString *)tt_substringFromIndex:(NSUInteger)from {
    if ([self isKindOfClass:[NSString class]]) {
        if (from <= self.length) {
            return [self substringFromIndex:from];
        }
    }
    return nil;
}

/**从开始截取到to位置的字符串*/
- (NSString *)tt_substringToIndex:(NSUInteger)toIndex {
    if ([self isKindOfClass:[NSString class]]) {
        if (toIndex <= self.length) {
            return [self substringToIndex:toIndex];
        }
    }
    return nil;
}

/**截取指定范围的字符串*/
- (NSString *)tt_substringWithRange:(NSRange)range {
    if ([self isKindOfClass:[NSString class]]) {
        if ((range.location + range.length) <= self.length && range.location <= self.length && range.length <= self.length) {
            return [self substringWithRange:range];
        }
    }
    return nil;
}

/**
 根据起始位字符串去截取特定位置的字符串
 
 @param startString 开始位置的字符串
 @param endString 结束位置字符串
 @return 截取过的字符串
 */
- (NSString *)tt_subStringFromStartStr:(NSString *)startString to:(NSString *)endString
{
    NSRange startRange = (startString && startString.length > 0) ? [self rangeOfString:startString] :NSMakeRange(0, 0);
    startRange = startRange.location != NSNotFound ? startRange : NSMakeRange(0, 0);
    
    NSRange endRange = (endString && endString.length > 0) ? [self rangeOfString:endString] : NSMakeRange(self.length, 0);
    endRange = endRange.location != NSNotFound ? endRange : NSMakeRange(0, 0);
    
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    return self.length > 0 ? [self tt_substringWithRange:range] : @"";
}

/**用URL对特殊字符的允许范围将字符串进行UTF8编码*/
- (NSString *)tt_URLQueryStringUTF8Encoding
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //    NSCharacterSet其他类方法的所代表的特殊字符串 下边表示了需要转码的特殊字符
    //    URLFragmentAllowedCharacterSet  @"#%<>[\]^`{|}"
    //    URLHostAllowedCharacterSet      @"#%/<>?@\^`{|}"
    //    URLPasswordAllowedCharacterSet  @"#%/:<>?@[\]^`{|}"
    //    URLPathAllowedCharacterSet      @"#%;<>?[\]^`{|}"
    //    URLQueryAllowedCharacterSet     @"#%<>[\]^`{|}"
    //    URLUserAllowedCharacterSet      @"#%/:<>?@[\]^`"
    
}

/**将字符串解码*/
- (NSString *)tt_stringDecoding
{
    return [self stringByRemovingPercentEncoding];
}
@end

#pragma mark -- Views

@implementation UIView (TTUtility)

- (void)setTt_x:(CGFloat)tt_x
{
    CGRect frame = self.frame;
    frame.origin.x = tt_x;
    self.frame = frame;
}

- (CGFloat)tt_x
{
    return self.frame.origin.x;
}

- (void)setTt_y:(CGFloat)tt_y
{
    CGRect frame = self.frame;
    frame.origin.y = tt_y;
    self.frame = frame;
}

- (CGFloat)tt_y
{
    return self.frame.origin.y;
}

- (void)setTt_width:(CGFloat)tt_width
{
    CGRect frame = self.frame;
    frame.size.width = tt_width;
    self.frame = frame;
}

- (CGFloat)tt_width
{
    return self.frame.size.width;
}

- (void)setTt_height:(CGFloat)tt_height
{
    CGRect frame = self.frame;
    frame.size.height = tt_height;
    self.frame = frame;
}

- (CGFloat)tt_height
{
    return self.frame.size.height;
}

- (CGFloat)tt_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)tt_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTt_centerX:(CGFloat)tt_centerX
{
    CGPoint center = self.center;
    center.x = tt_centerX;
    self.center = center;
}

- (CGFloat)tt_centerX
{
    return self.center.x;
}

- (void)setTt_centerY:(CGFloat)tt_centerY
{
    CGPoint center = self.center;
    center.y = tt_centerY;
    self.center = center;
}

- (CGFloat)tt_centerY
{
    return self.center.y;
}

/**
 设置一个默认无边框的圆角
 
 @param radius 圆角半径
 */
- (void)tt_setupConnerRadius:(CGFloat)radius
{
    [self tt_setupBorder:nil borderWidth:0 cornerRadius:radius];
}

- (void)tt_setupBorder:(UIColor *)borderColor
           borderWidth:(CGFloat)borderWidth
          cornerRadius:(CGFloat)radius;
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

@end

@implementation UITableView (TTUtility)

- (void)tt_registerNibClass:(nullable Class)cellClass forCellReuseIdentifier:(nullable NSString *)identifier
{
    
    if (!cellClass || !(identifier.length > 0 && identifier))
    {
        return;
    }
    
    NSString * nibName = [cellClass description];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:identifier];
    
}

@end

@implementation UICollectionView (TTUtility)

- (void)tt_registerNibClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier
{
    if (!cellClass || !(identifier && identifier.length > 0))
    {
        return;
    }
    NSString *nibName = [cellClass description];
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:identifier];
    
}
@end

@implementation UIColor (TTUtility)

+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert {
    return [self tt_colorWithHexString:stringToConvert alpha:1.0];
}

@end

@implementation UIImage (TTUtility)

/**
 以图片的中心点为拉伸点去拉伸图片
 
 @return 拉伸过的图片
 */
- (UIImage *)tt_resizableImageForSretchMode
{
    CGFloat hor = self.size.width *0.5 - 1;
    CGFloat ver = self.size.height *0.5 - 1;
    
    UIImage *img = [self resizableImageWithCapInsets:UIEdgeInsetsMake(ver, hor, ver, hor) resizingMode:UIImageResizingModeStretch];
    return img;
}

/**
 修改图片的前景色
 
 @param theColor 需要被修改成的前景色
 @return 修改过前景色的目标图片
 */
- (UIImage *)tt_rederWithColor:(UIColor *)theColor
{
    //    if (NULL != UIGraphicsBeginImageContextWithOptions)
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    //    else
    //        UIGraphicsBeginImageContext(baseImage.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, self.CGImage);
    [theColor set];
    CGContextFillRect(ctx, area);
    CGContextRestoreGState(ctx);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextDrawImage(ctx, area, self.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 屏幕截屏, 截取一个size为目标view本身尺寸的图片
 
 @param vi 目标view
 @return 生成的图片
 */
+ (UIImage *)tt_screenShotFromeView:(UIView *)vi
{
    return [UIImage tt_screenShotFromView:vi withSize:CGSizeZero];
}

/**
 屏幕截屏, 如果size为nil,默认使用目标view的size.
 
 @param vi 目标view
 @param size 目标尺寸
 @return 生成的图片
 */
+ (UIImage *)tt_screenShotFromView:(UIView *)vi withSize:(CGSize)size
{
    CGSize targetSize;
    if (CGSizeEqualToSize(size, CGSizeZero))
    {
        targetSize = vi.frame.size;
    }
    else
    {
        targetSize = size;
    }
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [vi.layer renderInContext:context];
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

@implementation CALayer (TTUtility)

/**左右抖动*/
- (void)tt_shake
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat shakeWidth = 16;
    keyAnimation.values = @[@(-shakeWidth),@(0),@(shakeWidth),@(0),@(-shakeWidth),@(0),@(shakeWidth),@(0)];
    //时长
    keyAnimation.duration = .1f;
    //重复
    keyAnimation.repeatCount =2;
    //移除
    keyAnimation.removedOnCompletion = YES;
    [self addAnimation:keyAnimation forKey:@"shake"];
}

@end
