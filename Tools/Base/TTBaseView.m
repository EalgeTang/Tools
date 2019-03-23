//
//  TTBaseView.m
//  Tools
//
//  Created by tangbowen on 2018/6/28.
//  Copyright © 2018年 tangbowen. All rights reserved.
//

#import "TTBaseView.h"

@implementation TTBaseView

+ (instancetype)build
{
    NSString *xibName = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:xibName
                                          owner:nil
                                        options:nil] firstObject];
}


@end
