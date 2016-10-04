//
//  StoneSingleton.m
//  FASHION
//
//  Created by MCLAB on 2016/10/3.
//  Copyright © 2016年 MCLAB. All rights reserved.
//

#import "StoneSingleton.h"

@implementation StoneSingleton
static StoneSingleton *_Stonesingleton = nil;
- (id) init
{
    self = [super init];
    return self;
}

+ (StoneSingleton *)shareSingletonObject
{
    static dispatch_once_t pred;
    static id StoneSingletons;
    dispatch_once(&pred, ^{
        StoneSingletons = [[self alloc]init];
    });
    return StoneSingletons;
}


@end
