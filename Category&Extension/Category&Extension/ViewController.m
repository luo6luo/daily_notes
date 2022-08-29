//
//  ViewController.m
//  Category&Extension
//
//  Created by lg on 2022/8/29.
//
//  Category 和 Extension 对比

#import "ViewController.h"
#import "ViewController+View.h"
#import "ViewController+Color.h"

#import "Person.h"
#import "Person+Age.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     Category
     优点：
     · 能为系统类添加分类
     · 将一个庞大的类，根据功能进行拆解
     · 私有方法向前引用(Person 例子中详解)
     缺点：
     · 无法直接添加属性(但是能通过关联对象来实现)
     
     Extension
     优点：
     · 实现类的拓展，私有化方法、属性、成员变量
     缺点：
     · 依托源码，没有自己的.m文件，必须依托源码实现
     
     两者不同
     · Category有.h和.m方法，Extension只有.h
     · Category能对系统进行拓展，Extension不行，它必须寄托于源码
     */
    
    // 创建view
    UIView *view = [self setupViewWithOrigin:CGPointMake(150, 200)];
    [self configRedForView:view];
    [self.view addSubview:view];
    
    // 通过类别，访问了Person的私有方法
    [Person printAge];
}

# pragma mark - Extension

- (void)configRedForView:(UIView *)view
{
    view.backgroundColor = [UIColor redColor];
}

- (void)configBlueForView:(UIView *)view
{
    view.backgroundColor = [UIColor blueColor];
}

@end
