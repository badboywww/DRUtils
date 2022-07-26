//
//  UIBarButtonItem+DRBarButtonItem.m
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import "UIBarButtonItem+DRBarButtonItem.h"

@implementation UIBarButtonItem (DRBarButtonItem)

+ (instancetype)itemWithImageName:(UIImage *)image
                    highImageName:(UIImage *)highimage
                           target:(nullable id)target
                           action:(nullable SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highimage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:view];
}

+ (instancetype)itemWithImageName:(UIImage *)image
                  selectImageName:(UIImage *)Selectimage
                           target:(id)target
                           action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:Selectimage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc]initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:view];
}

@end
