//
//  TTPlaceholderTextView.m
//  Tools
//
//  Created by tangbowen on 2018/6/6.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTPlaceholderTextView.h"
@interface TTPlaceholderTextView ()

@property (nonatomic,strong) UILabel *placeholderLabel;
@end
@implementation TTPlaceholderTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    if (self = [super init]) {
        
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.backgroundColor= [UIColor clearColor];
    _placeholderLabel = [[UILabel alloc]init];//添加一个占位label
    _placeholderLabel.backgroundColor= [UIColor clearColor];
    _placeholderLabel.numberOfLines=0; //设置可以输入多行文字时可以自动换行
    [self addSubview:_placeholderLabel];
    
    self.myPlaceholderColor= [UIColor lightGrayColor]; //设置占位文字默认颜色
    
    self.font= [UIFont systemFontOfSize:14]; //设置默认的字体
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
}

#pragma mark ----监听文字的变化
- (void)textDidChange {
    
    self.placeholderLabel.hidden = self.hasText;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect rect =  self.placeholderLabel.frame;
    rect.origin.x = 5;
    rect.origin.y = 8;
    float placeholderWidth = self.frame.size.width-10*2.0; //设置 UILabel 的 x
    rect.size.width = placeholderWidth;
    self.placeholderLabel.frame = rect;
    //根据文字计算高度
    
    CGSize maxSize =CGSizeMake(placeholderWidth,MAXFLOAT);
    
    float height = [self.myPlaceholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
    
    CGRect temp = self.placeholderLabel.frame;
    temp.size.height = height;
    temp.size.width = placeholderWidth;
    self.placeholderLabel.frame = temp;
}
#pragma mark --- 重写set get 方法

- (void)setMyPlaceholder:(NSString *)myPlaceholder {
    
    _myPlaceholder = [myPlaceholder copy];
    
    self.placeholderLabel.text = myPlaceholder;
    
    [self setNeedsLayout];
    
}

- (void)setMyPlaceholderColor:(UIColor *)myPlaceholderColor {
    
    _myPlaceholderColor = myPlaceholderColor;
    self.placeholderLabel.textColor = myPlaceholderColor;
}

- (void)setFont:(UIFont*)font{
    
    [super setFont:font];
    
    self.placeholderLabel.font= font;
    [self setNeedsLayout];
}


- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    [self textDidChange];
}


- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    
    [self textDidChange];
    
}

@end
