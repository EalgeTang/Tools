//
//  TTAppDelegate+GlobalAction.m
//  Tools
//
//  Created by tangbowen on 2018/7/2.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTAppDelegate+GlobalAction.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
@interface TTAppDelegate ()

@property (nonatomic ,strong) MBProgressHUD * mbHud;
@end

@implementation TTAppDelegate (GlobalAction)

#pragma mark -- HUD部分
- (void)showMessageHUDInWindowWithText:(NSString *)text
{
    [self showMessageHUDWithTitle:text detailText:nil inView:tkAppWindow];
}

- (void)showMessageHUDWithTitle:(NSString *)title detailText:(NSString *)detailText inView:(UIView *)vi
{
    [self showMessageHUDWithTitle:title detailText:detailText inView:vi hideAfterDelay:3.6f];
}

- (void)showMessageHUDWithTitle:(NSString *)title detailText:(NSString *)detailText inView:(UIView *)vi hideAfterDelay:(CGFloat)delay
{
    tkDispatch_async_on_main_queue(^{
        if (!vi)
        {
            
            return;
        }
        if (self.mbHud)
        {
            [self hideMessageHud];
        }
        
        self.mbHud = [MBProgressHUD showHUDAddedTo:vi animated:YES];
        self.mbHud.userInteractionEnabled=NO;
        self.mbHud.animationType = MBProgressHUDAnimationFade;
        [self.mbHud setMode:MBProgressHUDModeText];
        
        self.mbHud.label.font = [UIFont tt_systemFontWithSize:12];
        self.mbHud.detailsLabel.font = [UIFont tt_systemFontWithSize:12];
        self.mbHud.detailsLabel.text = detailText;
        self.mbHud.label.text = title;
        self.mbHud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;   // HUD主色调无效果, 默认MBProgressHUDBackgroundStyleBlur 毛玻璃效果
        self.mbHud.bezelView.backgroundColor = tkRGBAlphaColor(0, 0, 0, 0.6);
        self.mbHud.margin = 5;
        self.mbHud.contentColor = [UIColor whiteColor];
        CGFloat bottom = tkDeviceHeight / 8.f + 10;
        CGFloat offsetY = tkDeviceHeight / 2.f - bottom;
        self.mbHud.offset = tkPoint(0, offsetY);
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideMessageHud) object:nil];
        [self performSelector:@selector(hideMessageHud) withObject:nil afterDelay:delay];
        
    });
}

- (void)hideMessageHud
{
    if (!self.mbHud)
    {
        return;
    }
    [self.mbHud hideAnimated:YES];
    self.mbHud = nil;
    
}

- (void)setMbHud:(MBProgressHUD *)mbHud
{
    objc_setAssociatedObject(self, "mbHud", mbHud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)mbHud
{
    return objc_getAssociatedObject(self, "mbHud");
    
}

@end

