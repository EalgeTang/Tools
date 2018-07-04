//
//  TTAppDelegate+GlobalAction.h
//  Tools
//
//  Created by tangbowen on 2018/7/2.
//  Copyright © 2018年 tangbowen. All rights reserved.
//
// APPDelegate 本质上就是一个单例类, 所以 创建一个分类, 用来做那种需要作用于整个项目的轻量级应用, 比如hud.也可以不用污染delegate代码逻辑
#import "TTAppDelegate.h"

@interface TTAppDelegate (GlobalAction)

#pragma mark -- HUD部分

- (void)showMessageHUDInWindowWithText:(NSString *)text;

- (void)showMessageHUDWithTitle:(NSString *)title detailText:(NSString *)detailText inView:(UIView *)vi;

- (void)showMessageHUDWithTitle:(NSString *)title detailText:(NSString *)detailText inView:(UIView *)vi hideAfterDelay:(CGFloat)delay;

@end
