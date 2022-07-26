//
//  NSString+Extension.h
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

+ (CGSize)setTextSize:(NSString *)text Font:(float)font;

+ (CGSize)setTextSize:(NSString *)text FontSize:(UIFont *)fontSize;

@end

NS_ASSUME_NONNULL_END
