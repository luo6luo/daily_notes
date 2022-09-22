//
//  ViewController.m
//  static&const&extern&define
//
//  Created by tp on 2022/9/9.
//
//  static & const & extern & difine
//  参考资料：

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // static详解
//    [self explainStatic];
    
    // const详解
    [self explainConst];
}

# pragma mark - static

/// 非静态函数
void test0() {
    NSLog(@"非静态函数");
}

/// 静态函数
static void test1() {
    NSLog(@"静态函数");
}

/// static详解
- (void)explainStatic
{
    /**
     · 可用于修饰变量、全局变量、函数，使其生命周期变长，在整个程序运行期间都存在，程序结束由编译器释放
     · 被static修饰的变量、全局变量、函数，编译器只会为其分配一次内存
     · 被static修饰的变量、全局变量、函数，只能在本文件中访问，不能跨文件访问
     · 静态函数、非静态函数能被实例方法、类方法访问
     · 静态局部变量虽然会一直存在，但是拥有作用域
     */
    
    
    /**
     ---------------------- 测试静态函数、非静态函数 ----------------------
     
     输出结果：
     2022-09-09 18:17:53.540484+0800 static&const&extern&define[25689:314522] 非静态函数
     2022-09-09 18:17:53.540807+0800 static&const&extern&define[25689:314522] 静态函数
     2022-09-09 18:17:53.540991+0800 static&const&extern&define[25689:314522] 非静态函数
     2022-09-09 18:17:53.541144+0800 static&const&extern&define[25689:314522] 静态函数
     
     结论：
     实例方法、类方法都能访问静态函数、非静态函数
     */
    
    test0();
    test1();
    [ViewController test3];
    
    /**
     ---------------------- 测试静态局部变量作用域 ----------------------
     
     输出结果：
     2022-09-09 18:21:19.607179+0800 static&const&extern&define[25762:316808] a地址: 0x10b551640, 10
     2022-09-09 18:21:19.607319+0800 static&const&extern&define[25762:316808] a地址: 0x10b551644, 10
     2022-09-09 18:21:19.607474+0800 static&const&extern&define[25762:316808] a地址: 0x10b551644, 11
     2022-09-09 18:21:19.607607+0800 static&const&extern&define[25762:316808] a地址: 0x10b551644, 12
     
     结论：
     从结果看，不同的作用域，虽然定义的变量看似相同，实则是不同的两个静态局部变量
     但是同一作用域中，只有第一次访问该静态变量时才会为其分配内存，以后再次访问，则是直接取值
     */
    
    // 静态局部变量
    static int a = 10;
    NSLog(@"a地址: %p, %d", &a, a);
    
    [ViewController test2];
    [ViewController test2];
    [ViewController test2];
    
    /**
     ---------------------- 测试全局变量、静态全局变量 ----------------------
     
     输出：
     2022-09-09 18:21:28.539744+0800 static&const&extern&define[25762:316808] cc: 30
     
     结论：
     bb是静态全局变量，cc是全局变量
     断点调试可知，bb是没有获取到值的，cc已经获取到值
     说明被static修饰后，不管是局部变量还是全局变量，都有用作用域，不能跨文件访问
     */
    
    extern int bb;
    extern int cc;
    NSLog(@"cc: %d", cc);
}

/// 定义静态局部变量
+ (void)test2
{
    // 静态局部变量
    static int a = 10;
    NSLog(@"a地址: %p, %d", &a, a);
    a++;
}

/// 类方法访问 静态函数、非静态函数
+ (void)test3
{
    test0();
    test1();
}

# pragma mark - const

/// const详解
- (void)explainConst
{
    /**
     · 表示常量
     */
}

@end
