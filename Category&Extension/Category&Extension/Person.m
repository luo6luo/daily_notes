//
//  Person.m
//  Category&Extension
//
//  Created by lg on 2022/8/29.
//

#import "Person.h"

@interface Person ()

// 这是 Person 方法私有方法
+ (void)printAge;

@end

@implementation Person

+ (void)printAge
{
    NSLog(@"小明5岁了");
}

@end
