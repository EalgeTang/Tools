//
//  TTBaseViewController.h
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTBaseViewController : UIViewController


/**
 初始化方法 xib 创建VC也可以用此方法初始化

 @return 实例
 */
+ (instancetype)build;

#pragma  mark 通用的方法名

- (void)setupViews;

@end
