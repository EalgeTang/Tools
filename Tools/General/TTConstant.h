//
//  TTConstant.h
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//  如果是只通用于本身项目,而没办法保证之后通用的东西, 那么抽出来放在这个类中写,方便之后对utility的维护
//

#pragma  mark  框架内基本不变的东西
#import "TTAppDelegate.h"
#import <Foundation/Foundation.h>
#import "TTUtility.h"
#import "TTNavigationController.h"
#import "TTBaseView.h"
#import "TTTabBarController.h"
#import "TTBaseViewController.h"
#import "UIFont+TTSystem.h"
#import "Masonry.h"
#import "YYModel.h"
#import "TTAppDelegate+GlobalAction.h"
#import "TTPlaceholderTextView.h"

#define tk_iOS_10_Above    ([UIDevice currentDevice].systemVersion.floatValue>=10.0f)
#define tk_iOS_9_Above     ([[UIDevice currentDevice].systemVersion floatValue]>=9.0)
#define tk_iOS_8_Above     ([[UIDevice currentDevice].systemVersion floatValue]>=8.0)
#define tkAppDelegate      ((TTAppDelegate *)[UIApplication sharedApplication].delegate)
#define tkAppWindow        (tkAppDelegate.window)

#pragma mark 具体项目中的使用到的类

@interface TTConstant : NSObject


@end


