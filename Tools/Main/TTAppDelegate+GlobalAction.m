//
//  TTAppDelegate+GlobalAction.m
//  Tools
//
//  Created by tangbowen on 2018/7/2.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTAppDelegate+GlobalAction.h"
#import "MBProgressHUD.h"
@interface TTAppDelegate ()

@property (nonatomic ,strong) MBProgressHUD * mbHud;
@end
@implementation TTAppDelegate (GlobalAction)


- (void)showMessageHudWithTitle:(NSString *)title detailText:(NSString *)detailText inView:(UIView *)vi hideAfterDelay:(CGFloat)delay
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
        
        self.mbHud = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 260, 50)];
        self.mbHud.userInteractionEnabled=NO;
        self.mbHud.animationType = MBProgressHUDAnimationFade;
        [self.mbHud setMode:MBProgressHUDModeText];
//        self.mbHud.labelFont = [UIFont tt_systemFontWithSize:12];
//        self.mbHud.detailsLabelFont = [UIFont tt_systemFontWithSize:12];
//        self.mbHud.detailsLabelText = detailText;
//        self.mbHud.labelText = title;
        
        CGRect rt = vi.frame;
        rt = CGRectMake((rt.size.width-self.mbHud.frame.size.width)/2, rt.size.height-self.mbHud.frame.size.height - rt.size.height/8, self.mbHud.frame.size.width, self.mbHud.frame.size.height);
//        if ([Utilities isiPhone4])
//        {
//            rt.origin.y-=10;
//        }
        [self.mbHud setFrame:rt];
        
        self.mbHud.margin = 5;
        self.mbHud.layer.cornerRadius = 5;
        self.mbHud.layer.masksToBounds = YES;
        self.mbHud.autoresizingMask =     UIViewAutoresizingFlexibleLeftMargin|
        UIViewAutoresizingFlexibleWidth  |
        UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleBottomMargin ;
        
        [view addSubview:self.mbHud];
//        [self.mbHud show:YES];
        [self.mbHud showAnimated:YES];
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
@end

