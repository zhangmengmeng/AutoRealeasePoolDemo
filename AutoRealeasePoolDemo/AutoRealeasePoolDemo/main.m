//
//  main.m
//  AutoRealeasePoolDemo
//
//  Created by qingyun on 15-1-22.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EasyClass.h"

int main(int argc, const char * argv[])
{
#if 0
    
    // 推荐的自动释放池写法，有明确的这样一个大括号作为开始和结束的标志
    @autoreleasepool {
        
        NSObject *obj = [[NSObject alloc] init]; //1
        [obj retain]; // 2
        [obj autorelease];
        NSLog(@"retaincount >>>>> %lu", [obj retainCount]);
        
        NSObject *obj1 = [NSObject new]; // 1
        [obj1 retain]; // 2
        [obj1 autorelease];
        
        EasyClass *easyClass = [EasyClass new]; //1
        NSLog(@"easy class>>>>%@", easyClass);
        [easyClass release]; // 0
        
        // 记住一定要将所有所有需要设置为自动释放的对象的调用过程放在自动池的的创建和销毁中间
        [obj release];
        
    }
#else
    // 第二种自动释放池的写法, 不太优雅
    
    NSAutoreleasePool *pool; // 自动池的创建
    // 记住一定要将所有所有需要设置为自动释放的对象的调用过程放在自动池的的创建和销毁中间
    
    pool = [[NSAutoreleasePool alloc] init];
   
    
    
    NSObject *obj = [[NSObject alloc] init]; //1
    [obj retain]; // 2
    [obj autorelease];
    NSLog(@"obj---retaincount >>>>> %lu", [obj retainCount]);
    
    NSObject *obj1 = [NSObject new]; // 1
[obj1 retain]; // 2
    [obj1 autorelease];
    NSLog(@"obj1***retaincount >>>>> %lu", [obj retainCount]);
    
    EasyClass *easyClass = [EasyClass new]; //1
    NSLog(@"easy class>>>>%@", easyClass);
    [easyClass release]; // 0
    
    // 记住一定要将所有所有需要设置为自动释放的对象的调用过程放在自动池的的创建和销毁中间
    [obj release];
    //[obj release];
    NSLog(@"obj retaincount ****** %lu", [obj retainCount]);
    [pool release]; // 自动池的销毁
    [NSThread sleepForTimeInterval:10];
    NSLog(@"obj retaincount >>>>> %lu", [obj retainCount]);
    NSLog(@"obj1 retaincount >>***>>> %lu", [obj1 retainCount]);

#endif
    return 0;
}

