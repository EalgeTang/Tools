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

@end

#pragma mark -- Datas

@interface NSArray (TTUtility)

@property (nonatomic, assign, readonly) BOOL tt_isUseable;

@end

@interface NSDictionary (TTUtility)

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
- (NSString *)tt_URLQueryStringEncoding;

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

/**因为内联方法以 tk 开头方便检索*/
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

static inline UIColor *tkRGBColor(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}

static inline UIColor *tkRGBAlphaColor(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:alpha];
}

static inline UIColor *tkHexColor(NSString *hexColor){
    return [UIColor tt_colorWithHexString:hexColor];
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
