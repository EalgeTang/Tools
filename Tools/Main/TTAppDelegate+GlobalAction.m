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
        self.mbHud.bezelView.backgroundColor = [UIColor blackColor];
//        self.mbHud.offset = CGPointMake(0.f, offset_y);
        CGRect rt = vi.frame;
        rt = CGRectMake((rt.size.width-self.mbHud.frame.size.width)/2, rt.size.height-self.mbHud.frame.size.height - rt.size.height/8, self.mbHud.frame.size.width, self.mbHud.frame.size.height);
//        if ([Utilities isiPhone4])
//        {
//            rt.origin.y-=10;
//        }
        [self.mbHud setFrame:rt];
        
        self.mbHud.margin = 5;
        self.mbHud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.mbHud.backgroundView.color = [UIColor blackColor];
        self.mbHud.layer.cornerRadius = 5;
        self.mbHud.layer.masksToBounds = YES;
        self.mbHud.autoresizingMask =     UIViewAutoresizingFlexibleLeftMargin|
        UIViewAutoresizingFlexibleWidth  |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleBottomMargin ;
        
        [vi addSubview:self.mbHud];
        [self.mbHud showAnimated:YES];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideMessageHud) object:nil];
//        [self performSelector:@selector(hideMessageHud) withObject:nil afterDelay:delay];
        
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

