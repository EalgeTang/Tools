//
//  TTTestView.m
//  Tools
//
//  Created by tangbowen on 2019/2/14.
//  Copyright © 2019 tangbowen. All rights reserved.
//

#import "TTTestView.h"

@interface TTTestView  ()

@property (nonatomic) NSTimer *timer;
@end

@implementation TTTestView

- (void)dealloc
{
//    [self.timer invalidate];
//    self.timer = nil;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self =[super initWithCoder:aDecoder])
    {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)onTimer
{
    if (self.handle)
    {
        self.handle();
    }
}
@end
