//
//  UIImage+DRImage.h
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DRImage)

/**
    图片名称生成未渲染图片
 */
+ (instancetype)imageWithOriginalImageName:(NSString *)imagename;

/**
    拉伸图片
 */
+  (instancetype)imageWithImage:(UIImage *)image
                   leftCapWidth:(NSInteger)width
                   topCapHeight:(NSInteger)height;

/**
    根据宽度重新计算图片的高度比
 */
- (UIImage *)scaleToWidth:(CGFloat)width;

/**
 给指定图片加水印
 Watermark: 图片
 ImageSize:开启一个多大图片的上下文
 Opaque:不透明度 一般为 NO
 Scale:图片是否需要缩放 一般为0
 Watermarkstr:水印所添加的文字
 WatermarkstrColor:文字的颜色
 StrFont:文字的字号
 */

+(UIImage *)setImageAddWatermark:(UIImage *)image
                       imageSize:(CGSize)size
                          opaque:(BOOL)opaque
                           scale:(CGFloat)scale
                    watermarkstr:(NSString *)str
               watermarkstrColor:(UIColor *)strColor
                         strFont:(float)font;

/**
 给指定图片裁剪成圆形头像
 Cutpicture: 图片
 ImageSize:开启一个多大图片的上下文
 Opaque:不透明度 一般为 NO
 Scale:图片是否需要缩放 一般为0
 NewImageWidth:生成新图的宽度
 */
+(UIImage *)setImageAddCutpicture:(UIImage *)image
                        imageSize:(CGSize)size
                           opaque:(BOOL)opaque
                            scale:(CGFloat)scale
                    newImageWidth:(CGFloat)newimagewidth;

/**
 给指定图片裁剪成圆形头像--带边框
 Cutpicture: 图片
 ImageSize:开启一个多大图片的上下文
 Opaque:不透明度 一般为 NO
 Scale:图片是否需要缩放 一般为0
 NewImageWidth:生成新图的宽度
 */

+(UIImage *)imageWithBorderWidth:(CGFloat)borderW
                     borderColor:(UIColor *)color
                           image:(UIImage *)image
                   newImageWidth:(CGFloat)newimagewidth;

@end

NS_ASSUME_NONNULL_END
