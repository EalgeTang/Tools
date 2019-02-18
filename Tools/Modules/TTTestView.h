//
//  TTTestView.h
//  Tools
//
//  Created by tangbowen on 2019/2/14.
//  Copyright © 2019 tangbowen. All rights reserved.
//

#import "TTBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTTestView : TTBaseView

@property (nonatomic, copy) void (^handle)(void);
@end

NS_ASSUME_NONNULL_END
