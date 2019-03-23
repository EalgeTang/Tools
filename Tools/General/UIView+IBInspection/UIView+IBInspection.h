//
//  UIView+IBInspection.h
//  Dianzhuang
//
//  Created by Apple on 15/6/2.
//
//

#import <UIKit/UIKit.h>

@interface UIView (IBInspection)

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (copy, nonatomic) IBInspectable UIColor *borderColor;

@end
