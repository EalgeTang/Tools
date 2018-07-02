//
//  TTPlaceholderTextView.h
//  Tools
//
//  Created by tangbowen on 2018/6/6.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTPlaceholderTextView : UITextView

/**占位符*/
@property (nonatomic,copy) NSString *myPlaceholder;
/**占位符字体颜色*/
@property (nonatomic,strong) UIColor *myPlaceholderColor;

/**placeholder 的初始化方法*/
- (instancetype)initWithFrame:(CGRect)frame;

@end
