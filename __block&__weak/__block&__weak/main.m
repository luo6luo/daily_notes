//
//  main.m
//  __block&__weak
//
//  Created by lg on 2022/9/23.
//
//  __block&__weak
//  参考资料：
//  atomic & nunatomic:https://juejin.cn/post/6844903527815331854

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         常用修饰符：
         1、属性的常用修饰符：nonatomic、atomic、strong、weak、assign、copy、readWrite、onlyRead、unsafe_unretained、retain(MRC)、release(MRC)
         2、变量的常用修饰符：__strong、__weak、__block、__unsafe_unretained、__autoreleasing
         
         此处所说的的__weak等同于weak功能
         */
       
        // ---------------- __block ----------------
        /**
         · 可以修饰基础数据变量，对象类型变量也能修饰，但是一般都是用来修饰基础数据变量
         · 由于block的捕获机制，使基础数据类型即便在block内部也能修改
         · 被__block修饰的变量，实际是另外一种数据结构，被block捕获后，管理的是新数据接口的内存，不是原来的数据
         · 可能会造成循环引用，A持有block，在block中修改A的东西，A被__block修饰，这种情况会造成循环引用，
           解决办法，block中修改完A后，A = nil，释放循环
         */
       
        // ---------------- __weak ----------------
        /**
         · 只能修饰对象类型的变量
         · block捕获被__weak修饰的变量，不会对其进行内存管理，所以不会造成循环引用
         */
    }
    return 0;
}
