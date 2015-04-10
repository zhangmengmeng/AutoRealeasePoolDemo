//
//  EasyClass.m
//  AutoRealeasePoolDemo
//
//  Created by qingyun on 15-1-22.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "EasyClass.h"

@implementation EasyClass

- (NSString *)description
{
    NSString *desc = [[NSString alloc] initWithFormat:@"easy class,%d",1]; //1
    return [desc autorelease];
}

@end
