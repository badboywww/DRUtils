//
//  NSString+Extension.m
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (CGSize)setTextSize:(NSString *)text Font:(float)font {
    CGSize statuseStrSize = [NSString  setTextSize:text FontSize:[UIFont systemFontOfSize:font]];
    return statuseStrSize;
}

/// 获取字符串的长度和宽度
/// @param text 字符串
/// @param fontSize 字符串尺寸
+ (CGSize)setTextSize:(NSString *)text FontSize:(UIFont *)fontSize {
    //计算文本文字size
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:fontSize}];
    //获取宽高
    CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    return statuseStrSize;
}

@end
