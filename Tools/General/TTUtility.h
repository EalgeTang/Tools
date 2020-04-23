//
//  TTUtility.h
//  Tools
//
//  Created by tangbowen on 2018/5/30.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#endif

#define tkDeviceHeight          [UIScreen mainScreen].bounds.size.height
#define tkDeviceWidth           [UIScreen mainScreen].bounds.size.width
#define tkAdjust_Pad_BgVi_Width (tkIs_iPad ? 414.f : tkDeviceWidth)

#define tkIs_iPad          ([UIDevice tk_isiPad])
#define tk_iOS_10_Above    ([UIDevice currentDevice].systemVersion.floatValue>=10.0f)
#define tk_iOS_9_Above     ([[UIDevice currentDevice].systemVersion floatValue]>=9.0)
#define tk_iOS_8_Above     ([[UIDevice currentDevice].systemVersion floatValue]>=8.0)
#define tkAppDelegate      ((TTAppDelegate *)[UIApplication sharedApplication].delegate)
#define tkAppWindow        (tkAppDelegate.window)

#define tkAddNotification(NotiName,Sel) ([[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Sel) name:NotiName object:nil])
#define tkPostNotification(NotiName)    ([[NSNotificationCenter defaultCenter] postNotificationName:NotiName object:nil])
#define tkRemoveNotification            ([[NSNotificationCenter defaultCenter] removeObserver:self])

typedef void(^voidBlock)(void);

@interface TTUtility : NSObject

///获取windows当前现在的Vc
+ (UIViewController *)tt_getCurrentViewController;
///验证E-mail 格式
+ (BOOL)tt_validateEmail:(NSString *)email;
///验证中文
+ (BOOL)tt_validateChinese:(NSString *)str;
///验证数字
+ (BOOL)tt_validateNum:(NSString *)num;
/**
  使用传入的正则表达式用谓词的方法检验 某一段字符串 是否符合标准
 @param reg 正则表达式,需要符合oc语法, 需要转义`\` 的地方为`\\`
 @param str 需要校验的字符串
 @return 校验结果
 */
+ (BOOL)tt_validateRegExForPredicate:(NSString *)reg string:(NSString *)str;

//TODO: 项目信息相关
///APP的icon
+ (UIImage *)tt_appIcon;
///设备型号
+ (NSString *)tt_deviceModel;
///app的名字
+ (NSString *)tt_appName;
///获取info表
+ (NSDictionary *)tt_bundleInfoDictionary;
///app版本
+ (NSString *)tt_appVersion;
///app build version
+ (NSString *)tt_appBuildVersion;
///系统版本
+(NSString *)tt_systemVersion;
///向UserDefault中存储数据, 建议只存储轻量级数据
+ (BOOL)tt_storeObjectToUserDefault:(id)obj key:(NSString *)key;
///从userDefault中取出指定的数据
+ (id)tt_objectFromeUseDefaultWithKey:(NSString *)key;

///删除指定的数据
+ (BOOL)tt_removeObjectFromUserDefaultWithKey:(NSString *)key;

///改变二维码尺寸大小
+ (UIImage *)tt_qrCodeImageWithContent:(NSString *)content
                      codeImageSize:(CGFloat)size;
///生成最原始的二维码
+ (CIImage *)tt_qrCodeImageWithContent:(NSString *)content;

+ (nullable NSString *)tt_getValueInUrl:(NSString *)url byKey:(NSString *)key;
@end

@interface NSObject (TTUtility)

//类名
- (NSString *)tt_className;
+ (NSString *)tt_className;

//父类名称
- (NSString *)tt_superClassName;
+ (NSString *)tt_superClassName;

@end

@interface UIDevice (TTUtility)
+ (BOOL)tk_isiPad;
@end

#pragma mark -- Datas
UIKIT_EXTERN NSString *const tkDateFormat_yyyyMMddHHmmss_hyphen;//yyyy-MM-dd HH:mm:ss
UIKIT_EXTERN NSString *const tkDateFormat_yyyyMMdd_none;//yyyyMMdd ,eg: 20190101
@interface NSDate (TTUtility)

+ (NSDate *)tt_getCnDateWithSystemDate:(NSDate *)aAnyDate;
///获取中国本地时间
+ (NSDate *)tt_getCNDateFromString:(NSString *)dateString withFormatString:(NSString *)formatString;
///获取中国时间字符串
+ (NSString *)tt_getCNDateStringFromDate:(NSDate *)date formatString:(NSString *)formatString;
///得到类似 x分钟前/ x秒钱/ x天前的展示格式
+ (NSString *)tt_getTimeAgoWithInterval:(NSTimeInterval)interval;
@end

@interface NSLayoutConstraint (TTUtility)

- (void)tt_addFullScreenStatusBarHeight;
- (void)tt_add:(CGFloat)x;
- (void)tt_mutiply:(CGFloat)x;
@end

@interface NSIndexPath (TTUtility)
///返回一个 以此对象为基础加了 X item的对象
- (NSIndexPath *)tt_addItem:(NSInteger)add;
///返回一个 以此对象为基础加了 X section的对象
- (NSIndexPath *)tt_addSection:(NSInteger)add;
@end

@interface NSArray (TTUtility)

///是否可以正常使用, 即数据存在并且数量大于0
@property (nonatomic, assign, readonly) BOOL tt_isUseable;
///数据结构存在, 但数量为空
@property (nonatomic, assign, readonly) BOOL tt_isEmpty;

- (nullable NSString *)tt_JSONString;
@end

@interface NSDictionary (TTUtility)

///是否可以正常使用, 即数据存在并且数量大于0
@property (nonatomic, assign, readonly) BOOL tt_isUseable;
///数据结构存在, 但是数量为空
@property (nonatomic, assign, readonly) BOOL tt_isEmpty;
///获取int类型的数据
- (int)tt_intAttribute:(NSString *)attribute defaultValue:(int)defaultValue;
///获取bool类型的数据
- (BOOL)tt_boolAttribute:(NSString *)attribute defaultValue:(BOOL)defalutValue;
///获取float类型的数据
- (float)tt_floatAttribute:(NSString *)attribute defaultValue:(float)defaultValue;
///获取NSInteger类型的数据
- (NSInteger)tt_integerAttribute:(NSString *)attribute defaultValue:(NSInteger)defaultValue;

///获取NSString类型的数据
- (NSString *)tt_stringAttributeIncludeNil:(NSString *)attribute;
- (NSString *)tt_stringAttribute:(NSString *)attribute;
- (NSArray *)tt_arrayAttribute:(NSString *)attribute;

- (nullable NSString *)tt_JSONString;
@end

@interface NSData (TTUtility)

@end

@interface NSString (TTUtility)

@property (nonatomic, assign, readonly) BOOL tt_isUseable;
///数据结构存在, 但长度为空
@property (nonatomic, assign, readonly) BOOL tt_isEmpty;
/**
 根据指定的起始字符串以及结束字符串去截取特定位置的字符串
 @param startString 开始位置的字符串
 @param endString 结束位置字符串
 @return 截取过的字符串
 */
- (NSString *)tt_subStringFromStartStr:(NSString *)startString to:(NSString *)endString;
///判断是否包含字符串aString
- (BOOL)tt_containString:(NSString *)aString;
/// 判断是否为整数
- (BOOL)isPureInt;
///截取range范围
- (NSString *)tt_substringWithRange:(NSRange)range;
///NSString 从某个地方开始截取
- (NSString *)tt_substringFromIndex:(NSUInteger)from;
///NSString 从截取到某个地方
- (NSString *)tt_substringToIndex:(NSUInteger)toIndex;

///用URL对特殊字符的允许范围将字符串进行UTF8编码
- (NSString *)tt_URLQueryStringUTF8Encoding;
///将字符串解码
- (NSString *)tt_stringDecoding;

- (id)tt_objectFromJSONString;
///拼装成银行卡那4字一个空格的格式
- (NSString *)tt_bankCardNumFormart;
///去除空格 注意: 这个方法不能用在  text filed  的 edit changed 监听方法当中,  否则会引起汉字情况下的输入异常
- (NSString *)tt_takeOutSpace;
/**
 获取string的尺寸
 @param maxSize string 所在的容器的所能支持的最大尺寸.
 @param font string的font
 @return string的尺寸
 */
- (CGSize)tt_getStringSizeWithContentMaxSize:(CGSize)maxSize font:(UIFont *)font;
///给定指定宽度, 高度不做限制,获取文字size
- (CGSize)tt_getStringSizeWithFixedWidth:(CGFloat)fixedWidth font:(UIFont *)font;

@end

@interface NSAttributedString (TTUtility)

///获取attributeString的尺寸
- (CGSize)tt_getAttributeStringWithContainerMaxSize:(CGSize)maxSize;
///给定指定宽度,高度不做限制,获取attributeStr的尺寸
- (CGSize)tt_getAttributeStringWithFixedWidth:(CGFloat)fixedWidth;

@end
#pragma mark -- Views

typedef void(^gestureBlock)(UIGestureRecognizer *gesture);
@interface UIView (TTUtility)

///坐标相关
@property CGFloat tt_x;
@property CGFloat tt_y;
@property CGFloat tt_width;
@property CGFloat tt_height;
@property (nonatomic, assign) CGFloat tt_centerX;
@property (nonatomic, assign) CGFloat tt_centerY;
@property (readonly) CGFloat tt_bottom;
@property (readonly) CGFloat tt_right;

///设置一个默认无边框的圆角
- (void)tt_setupConnerRadius:(CGFloat)radius;
///设置圆角 以及圆角边框展示
- (void)tt_setupBorder:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)radius;
///添加手势触发时 ,若没有添加对应的方法, 则会默认响应
@property (nonatomic, copy) gestureBlock tt_gestureHandle;
///添加一个target为控件本身的一个点击手势
- (UITapGestureRecognizer *)tt_addTapGestureWithSel:(nullable SEL)action;
///添加一个target为控件本身的拖动手势
- (UIPanGestureRecognizer *)tt_addPanGestureWithSel:(nullable SEL)action;
///添加一个target为控件本身轻扫手势
- (UISwipeGestureRecognizer *)tt_addSwipeGestureWithSel:(nullable SEL)action;
///添加一个target为控件本身旋转手势
- (UIRotationGestureRecognizer *)tt_addRotationGestureWithSel:(nullable SEL)action;
///添加一个target为控件本身捏合手势
- (UIPinchGestureRecognizer *)tt_addPinGestureWithSel:(nullable SEL)action;
///添加一个target为控件本身长按手势
- (UILongPressGestureRecognizer *)tt_addLongPressGestureWithSel:(nullable SEL)action;
///target为控件本身的边缘拖动手势
- (UIScreenEdgePanGestureRecognizer *)tt_addScreendEdgePanGestureWithSel:(nullable SEL)action;

///添加一个点击手势
- (UITapGestureRecognizer *)tt_addTapGestureWithTarget:(id)target sel:(nullable SEL)action;
///添加一个拖动手势
- (UIPanGestureRecognizer *)tt_addPanGestureWithTarget:(id)target sel:(nullable SEL)action;
///添加一个清扫手势
- (UISwipeGestureRecognizer *)tt_addSwipeGestureWithTarget:(id)target sel:(nullable SEL)action;
///添加一个旋转手势
- (UIRotationGestureRecognizer *)tt_addRotationGestureWithTarget:(id)target sel:(nullable SEL)action;
///添加一个捏合手势
- (UIPinchGestureRecognizer *)tt_addPinGestureWithTarget:(id)target sel:(nullable SEL)action;
///添加一个长按手势
- (UILongPressGestureRecognizer *)tt_addLongPressGestureWithTarget:(id)target sel:(nullable SEL)action;
///边缘拖动手势
- (UIScreenEdgePanGestureRecognizer *)tt_addScreendEdgePanGestureWithTarget:(id)target sel:(SEL)action;
///添加一个放大效果动画
- (void)tt_addZoomInAnimationWithComplete:(nullable voidBlock)complete;
///添加一个放大效果动画
- (void)tt_addZoomInAnimationWithDuration:(CGFloat)duration
                               startBlock:(nullable voidBlock)start
                            progressBlock:(nullable voidBlock)progress
                                 complete:(nullable voidBlock)complete;
///添加一个缩小效果的动画
- (void)tt_addZoomOutAnimationWithComplete:(nullable voidBlock)complete;
///添加一个缩小效果的动画
- (void)tt_addZoomOutAnimationWithDuration:(CGFloat)duration
                                startBlock:(nullable voidBlock)start
                             progressBlock:(nullable voidBlock)progress
                                  complete:(nullable voidBlock)complete;
///添加一个渐入动画
- (void)tt_addFadeInAnimationWithDuration:(CGFloat)duration
                                 complete:(nullable voidBlock)complete;

///添加一个渐入动画
- (void)tt_addFadeInAnimationWithDuration:(CGFloat)duration
                               startBlock:(nullable voidBlock)start
                            progressBlock:(nullable voidBlock)progress
                                 complete:(nullable voidBlock)complete;

///添加一个渐出动画
- (void)tt_addFadeOutAnimationWithDuration:(CGFloat)duration
                                  complete:(nullable voidBlock)complete;
///添加一个渐出动画
- (void)tt_addFadeOutAnimationWithDuration:(CGFloat)duration
                                startBlock:(nullable voidBlock)start
                             progressBlock:(nullable voidBlock)progress
                                  complete:(nullable voidBlock)complete;

- (void)tt_addFadeToAlpha:(CGFloat)alpha
                 duration:(CGFloat)duration
               startBlock:(nullable voidBlock)start
            progressBlock:(nullable voidBlock)progress
                 complete:(nullable voidBlock)comple;


@end

@interface UILabel (TTUtility)

///给定一个容器的最大size, 返回文字的size
- (CGSize)tt_getStringSizeWithContainerViMaxSize:(CGSize)containerViMaxSize;
- (CGSize)tt_getAttributeStringWithContainerViMaxSize:(CGSize)containerViMaxSize;
///给定label的宽度, 返回Label文字显示需要的高度
- (CGSize)tt_getStringSizeWithContainerViFixedWith:(CGFloat)containerViFixedWidth;
- (CGSize)tt_getAttributeStringSizeWithContainerViFixedWidth:(CGFloat)containerViFixedWidth;

@end
@interface UITableView (TTUtility)
///注册一个使用xib创建的cell , cell 的identifier设置为:className+ID
- (void)tt_registerCellNibClass:(nullable Class)cellClass;
- (void)tt_registerNibClass:(nullable Class) cellClass forCellReuseIdentifier:(nullable NSString *)identifier;

@end

@interface UITableViewCell (TTUtility)
+ (NSString *)tt_cellIdentifer;
@end

@interface UICollectionView (TTUtility)

- (void)tt_registerCellNibClass:(Class)cellClass;
- (void)tt_registerCellNibClass:(Class)cellClass forCellReuseIdentifier:(nullable NSString *)identifier;
- (void)tt_registerHeaderNibClass:(Class)headerClass;
- (void)tt_registerFooterNibClass:(Class)footerClass;
- (void)tt_registerNIBClass:(Class)nibClass forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(nullable NSString *)identifier;

@end

@interface UICollectionViewCell (TTUtility)
+ (NSString *)tt_cellIdentifer;
@end

@interface UICollectionReusableView (TTUtility)
+ (NSString *)tt_reusableViewIdentifier;
@end

typedef NS_ENUM(NSUInteger, TTButtonEdgeInsetsStyle) {
    TTButtonEdgeInsetsStyleImageTop,      // image在上 , label在下
    TTButtonEdgeInsetsStyleImageLeft,     // image在左 , label在右
    TTButtonEdgeInsetsStyleImageBottom,   // image在下 , label在上
    TTButtonEdgeInsetsStyleImageRight,    // image在右 , label在左
};
@interface UIButton (TTUtility)

@property (nonatomic, strong) UIFont *tt_titleFont;

- (void)tt_layoutButtonWithEdgeInsetsStyle:(TTButtonEdgeInsetsStyle)style
                                     space:(CGFloat)space;

- (void)tt_setNormalImageNamed:(NSString *)imageName;
- (void)tt_setSelectedImaged:(NSString *)imageName;
- (void)tt_setNormalTitle:(NSString *)title;
- (void)tt_setSelectedTitle:(NSString *)title;
- (void)tt_setNormalTitleColor:(UIColor *)titleColor;
- (void)tt_setSelectedTitleColor:(UIColor *)titleColor;
- (void)tt_setImageNamed:(NSString *)imageName status:(UIControlState)status;
- (void)tt_setTitle:(NSString *)title status:(UIControlState)status;
- (void)tt_setTitleColor:(UIColor *)titleColor status:(UIControlState)status;
///将image以拉伸的形式之后重置
- (void)tt_updateImageForScretch:(UIControlState)status;
///将BackgroudImage以拉伸的形式之后重置
- (void)tt_updateBackgroudImageForScretch:(UIControlState)status;
@end

@interface UIImageView (TTUtility)
///将image以拉伸的形式之后重置
- (void)tt_updateImageForScretch;
@end

#pragma mark -- others
@interface UIColor (TTUtility)

+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)tt_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end

@interface UIImage (TTUtility)

///以图片的中心点为拉伸点去拉伸图片
- (UIImage *)tt_resizableImageForSretchMode;
///修改图片的前景色
- (UIImage *)tt_rederWithColor:(UIColor *)theColor;
///屏幕截屏, 截取一个size为目标view本身尺寸的图片
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
///左右抖动
- (void)tt_shake;
///自转/旋转
- (void)tt_rotation;

@end

/**
 因为内联方法以 tk 开头方便检索
 之所以把内联方法放到最下面书写是因为有的内联方法是用到上面自己写的方法的, 如果放在最上面的话,
 自己写的方法就会因为找不到而报错了
 */
#pragma mark -- 些常用的内联方法
static inline void tkDispatch_safe_on_main_queue(void(^block)(void)){
    if([NSThread isMainThread])
    {
        block();
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            block();
        });
    }
}

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

static inline CGFloat tkStatusBarHeight(){
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

/**
 判断是否为iPhone X 机型,  后续可能为 iPhone X 后续带刘海屏机型的判断依据

 @return yes 为iPhone X机型
 */
static inline BOOL tkIsFullScreenIPhone(){
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *window = app.keyWindow;
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = window.safeAreaInsets;
        return insets.bottom> 0 ;
    }
    return NO;
}

static inline UIColor *tkRGBColor(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}

static inline UIColor *tkRGBAlphaColor(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:alpha];
}

static inline UIColor *tkWhiteColor(){
    return [UIColor whiteColor];
}

static inline UIColor *tkClearColor(){
    return [UIColor clearColor];
}

static inline UIColor *tkHexColor(NSString *hexColor){
    return [UIColor tt_colorWithHexString:hexColor];
}

///生成一个随机颜色.
static inline UIColor *tkRandowColor(){
    NSInteger rValue = arc4random() % 255;
    NSInteger gValue = arc4random() % 255;
    NSInteger bValue = arc4random() % 255;
    return [UIColor colorWithRed:rValue/255.f green:gValue/255.f blue:bValue/255.f alpha:1.0];
    
}

static inline UIImage *tkImageName(NSString *imageName){
    return [UIImage imageNamed:imageName];
}

static inline NSURL *tkURL(NSString *url){
    return [NSURL URLWithString:url];
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
static inline NSString *tkCachePathAppend(NSString *append){
    return [tkCachePath() stringByAppendingPathComponent:append];
}
static inline NSString *tkDocumentPathAppend(NSString *append){
    return [tkDocumentPath() stringByAppendingPathComponent:append];
}
///国际化设置, 传入国际化文件中自己设置的语言key值
static inline NSString *tkLanguage(NSString *string){
    return NSLocalizedString(string, nil);
}

NS_ASSUME_NONNULL_END
