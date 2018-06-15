//
//  TTUtility.h
//  Tools
//
//  Created by tangbowen on 2018/5/30.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface TTUtility : NSObject

/**
 获取windows当前现在的Vc
 @return Windows 上正在展示的VC
 */
+ (UIViewController *)tt_getCurrentViewController;

/**
 验证E-mail 格式
 @param email 需要验证的emal格式
 @return 格式是否正确
 */
+ (BOOL)tt_validateEmail:(NSString *)email;

/**
 验证中文
 */
+ (BOOL)tt_validateChinese:(NSString *)str;

/**
  使用传入的正则表达式用谓词的方法检验 某一段字符串 是否符合标准

 @param reg 正则表达式,需要符合oc语法, 需要转义`\` 的地方为`\\`
 @param str 需要校验的字符串
 @return 校验结果
 */
+ (BOOL)tt_validateRegExForPredicate:(NSString *)reg string:(NSString *)str;

/**APP的icon*/
+ (UIImage *)tt_appIcon;
/**设备型号*/
+ (NSString *)tt_deviceModel;
/**app的名字*/
+ (NSString *)tt_appName;

@end

@interface NSObject (TTUtility)

//类名
- (NSString *)tt_className;
+ (NSString *)tt_className;

//父类名称
- (NSString *)tt_superClassName;
+ (NSString *)tt_superClassName;

@end
#pragma mark -- Datas

@interface NSArray (TTUtility)

/**是否可以正常使用, 即数据存在并且数量大于0*/
@property (nonatomic, assign, readonly) BOOL tt_isUseable;

@end

@interface NSDictionary (TTUtility)

/**
 是否可以正常使用, 即数据存在并且数量大于0
 */
@property (nonatomic, assign, readonly) BOOL tt_isUseable;
/**
 获取int类型的数据
 */
- (int)tt_intAttribute:(NSString *)attribute defaultValue:(int)defaultValue;
/**
 获取NSInteger类型的数据
 */
- (NSInteger)tt_integerAttribute:(NSString *)attribute defaultValue:(NSInteger)defaultValue;

/**
 获取float类型的数据
 */
- (float)tt_floatAttribute:(NSString *)attribute defaultValue:(float)defaultValue;

/**
 获取bool类型的数据
 */
- (BOOL)tt_boolAttribute:(NSString *)attribute defaultValue:(BOOL)defalutValue;

/**
 获取NSString类型的数据
 */
- (NSString *)tt_stringAttributeIncludeNil:(NSString *)attribute;

- (NSString *)tt_stringAttribute:(NSString *)attribute;

- (NSArray *)tt_arrayAttribute:(NSString *)attribute;

@end

@interface NSData (TTUtility)

@end

@interface NSString (TTUtility)

@property (nonatomic, assign, readonly) BOOL tt_isUseable;

/**
 根据指定的起始字符串以及结束字符串去截取特定位置的字符串
 
 @param startString 开始位置的字符串
 @param endString 结束位置字符串
 @return 截取过的字符串
 */
- (NSString *)tt_subStringFromStartStr:(NSString *)startString to:(NSString *)endString;

/**截取range范围*/
- (NSString *)tt_substringWithRange:(NSRange)range;

/**判断是否包含字符串aString*/
- (BOOL)tt_containString:(NSString *)aString;

/**NSString 从某个地方开始截取*/
- (NSString *)tt_substringFromIndex:(NSUInteger)from;

/**NSString 从截取到某个地方*/
- (NSString *)tt_substringToIndex:(NSUInteger)toIndex;

/**用URL对特殊字符的允许范围将字符串进行UTF8编码*/
- (NSString *)tt_URLQueryStringUTF8Encoding;

/**将字符串解码*/
- (NSString *)tt_stringDecoding;

@end

#pragma mark -- Views
@interface UIView (TTUtility)

// 坐标相关
@property CGFloat tt_x;
@property CGFloat tt_y;
@property CGFloat tt_width;
@property CGFloat tt_height;
@property (nonatomic, assign) CGFloat tt_centerX;
@property (nonatomic, assign) CGFloat tt_centerY;
@property (readonly) CGFloat tt_bottom;
@property (readonly) CGFloat tt_right;



/**
 设置一个默认无边框的圆角

 @param radius 圆角半径
 */
- (void)tt_setupConnerRadius:(CGFloat)radius;

/**
 设置圆角 以及圆角边框展示

 @param borderColor 圆角边框的颜色值
 @param borderWidth 圆角边框的宽度
 @param radius 圆角边框半径
 */
- (void)tt_setupBorder:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)radius;

@end

@interface UITableView (TTUtility)

- (void)tt_registerNibClass:(nullable Class) cellClass forCellReuseIdentifier:(nullable NSString *)identifier;

@end

@interface UICollectionView (TTUtility)

- (void)tt_registerNibClass:(nullable Class) cellClass forCellReuseIdentifier:(nullable NSString *)identifier;

@end

#pragma mark -- others
@interface UIColor (TTUtility)

+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end

@interface UIImage (TTUtility)

/**
 以图片的中心点为拉伸点去拉伸图片

 @return 拉伸过的图片
 */
- (UIImage *)tt_resizableImageForSretchMode;

/**
 修改图片的前景色

 @param theColor 需要被修改成的前景色
 @return 修改过前景色的目标图片
 */
- (UIImage *)tt_rederWithColor:(UIColor *)theColor;

/**
  屏幕截屏, 截取一个size为目标view本身尺寸的图片

 @param vi 目标view
 @return 生成的图片
 */
+ (UIImage *)tt_screenShotFromeView:(UIView *)vi;

/**
 屏幕截屏, 如果size为zero,默认使用目标view的size.

 @param vi 目标view
 @param size 目标尺寸
 @return 生成的图片
 */
+ (UIImage *)tt_screenShotFromView:(UIView *)vi withSize:(CGSize)size;
@end

@interface CALayer (TTUtility)

/**左右抖动*/
- (void)tt_shake;

@end
/**
 因为内联方法以 tk 开头方便检索
 之所以把内联方法放到最下面书写是因为有的内联方法是用到上面自己写的方法的, 如果放在最上面的话,
 自己写的方法就会因为找不到而报错了
 */
#pragma 一些常用的内联方法
static inline CGRect tkRect(CGFloat x, CGFloat y, CGFloat width, CGFloat height){
    return CGRectMake(x, y, width, height);
}

static inline CGPoint tkPoint(CGFloat x, CGFloat y){
    return CGPointMake(x, y);
}

static inline CGSize tkSize(CGFloat width, CGFloat height){
    return CGSizeMake(width, height);
}

static inline CGFloat tkNavHeight(){
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.f;
}

/**
 判断是否为iPhone X 机型,  后续可能为 iPhone X 后续带刘海屏机型的判断依据

 @return yes 为iPhone X机型
 */
static inline BOOL tkIsIPhoneX(){
    UIApplication *app = [UIApplication sharedApplication];
    UIView *statusBar = [app valueForKeyPath:@"statusBar"];
    if ([statusBar isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")])
    {
        return YES;
    }
    return NO;
}

static inline CGFloat tkDeviceHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}

static inline CGFloat tkDeviceWidth(){
    return [UIScreen mainScreen].bounds.size.width;
}

static inline UIColor *tkRGBColor(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}

static inline UIColor *tkRGBAlphaColor(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:alpha];
}

static inline UIColor *tkHexColor(NSString *hexColor){
    return [UIColor tt_colorWithHexString:hexColor];
}

/**
 生成一个随机颜色.
 */
static inline UIColor *tkRandowColor(){
    NSInteger rValue = arc4random() % 255;
    NSInteger gValue = arc4random() % 255;
    NSInteger bValue = arc4random() % 255;
    return [UIColor colorWithRed:rValue/255.f green:gValue/255.f blue:bValue/255.f alpha:1.0];
    
}

static inline UIImage *tkImageName(NSString *imageName){
    return [UIImage imageNamed:imageName];
}

static inline UIColor *tkHexColorWithAlpha(NSString *hexColor, CGFloat alpha){
    return [UIColor tt_colorWithHexString:hexColor alpha:alpha];
}

static inline NSString *tkDocumentPath(){
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

static inline NSString *tkCachePath(){
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

/**国际化设置, 传入国际化文件中自己设置的语言key值*/
static inline NSString *tkLanguage(NSString *string){
    return NSLocalizedString(string, nil);
}
