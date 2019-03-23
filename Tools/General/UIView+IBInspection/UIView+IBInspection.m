//
//  UIView+IBInspection.m
//  Dianzhuang
//
//  Created by Apple on 15/6/2.
//
//

#import "UIView+IBInspection.h"

@implementation UIView (IBInspection)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (!self.layer.masksToBounds)
    {
        self.layer.masksToBounds = YES;
    }
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (!self.layer.masksToBounds)
    {
        self.layer.masksToBounds = YES;
    }
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
