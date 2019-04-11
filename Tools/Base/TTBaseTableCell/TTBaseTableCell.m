//
//  TTBaseTableCell.m
//  Tools
//
//  Created by eagle on 2019/4/11.
//  Copyright © 2019 tangbowen. All rights reserved.
//

#import "TTBaseTableCell.h"

@implementation TTBaseTableCell

+ (NSString *)tt_CellIdentifier
{
    NSString *cellId = [self tt_className];
    cellId = [cellId stringByAppendingString:@"ID"];
    return cellId;
}

@end
