//
//  ViewController+View.m
//  Category&Extension
//
//  Created by lg on 2022/8/29.
//

#import "ViewController+View.h"

@implementation ViewController (View)

- (UIView *)setupViewWithOrigin:(CGPoint)origin
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, 50, 50)];
    return view;
}

@end
