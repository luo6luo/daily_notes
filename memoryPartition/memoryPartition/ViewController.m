//
//  ViewController.m
//  memoryPartition
//
//  Created by tp on 2022/9/9.

#import "ViewController.h"
#import "Person.h"

int b = 20;
static int c = 30;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    /**
     在认识这几个关键字之前，我们再来复习下OC的内存分区
     
     高地址 -------------------------------------------------> 低地址
     内核区 -> 栈区 -> 堆区 -> 全局区(静态区) -> 常量区 -> 代码区 -> 保留区
     
     实际上就是分5大区：
     栈区(Stack)
     堆区(Heap)
     全局区(静态区)
     常量区
     代码区(.text)
     */
    
    /**
     ----------------- 栈区 -----------------
     · 由编译器进行内存管理，在运行时分配，自动分配、释放内存
     · 主要存放局部变量、指针、函数的参数
     · 栈区的内存地址是连续的，从高到低扩展，先进后出
     · 地址一般由 0x7 开头
     · 内存空间较小，但是读写效率高
     
     输出结果：0x7ffee400801c, 0x7ffee4008010
     */
    int a = 10;
    NSObject *oc = [[NSObject alloc] init];
    NSLog(@"%p, %p", &a, &oc);
    
    /**
     ----------------- 堆区 -----------------
     · 由开发者进行内存管理，由开发者申请内存，释放时机也是程序员决定
     · 在程序运行时分配内存
     · 地址不是连续的，由低地址向高地址延展，先进先出
     · 主要存放对象
     · 地址一般由 0x6 开头
     
     输出结果：0x6000026d8570
     */
    Person *p = [[Person alloc] init];
    NSLog(@"%p", p);
    
    /**
     ----------------- 全局区/静态区 -----------------
     · 在编译阶段就分配好的内存空间
     · 数据在整个程序运行时期都存在，随着程序的结束而编译器释放
     · 整个区分为：.bss(未初始化) 和 .data(已初始化)
     · 地址一般由 0x1 开头
     
     输出结果：0x10bbfd608, 0x10bbfd610, 0x10bbfd60c
     */
    static int d = 40;
    NSLog(@"%p, %p, %p", &b, &c, &d);
    
    /**
     ----------------- 常量区 -----------------
     · 由编译器进行内存管理，在编译阶段就分配好内存
     · 也是整个程序运行期间都存在，最后随着程序结束而销毁
     · 一般存储的是常量字符串，只此一份
     
     输出结果：0x10bbf8080 0x10bbf8080
     */
    NSString *str = @"123";
    NSString *str2 = @"123";
    NSLog(@"%p %p", str, str2);
    
    /**
     ----------------- 代码区 -----------------
     · 程序代码被编译成二进制形式，存储在此区
     */
    
    /**
     ----------------- 其他区 -----------------
     · 在比栈区更高的区，有一个内核区，主要用于消息处理、多线程操作
     · 在比代码区更低的区，有一个保留区，主要是做 nil = 0x0 处理
     */
    
    // ***************************************
    // 总结示意图.png 做了个简单明了的总结
    // 但是对于数据段理解有点出入
    // ***************************************
}


@end
