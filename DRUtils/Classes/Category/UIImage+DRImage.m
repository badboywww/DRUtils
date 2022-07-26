//
//  UIImage+DRImage.m
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import "UIImage+DRImage.h"
#import "NSString+Extension.h"

@implementation UIImage (DRImage)

#pragma 添加不渲染的图片
+ (instancetype)imageWithOriginalImageName:(NSString *)imagename {
    UIImage *image = [UIImage imageNamed:imagename];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

#pragma 图片拉伸
+ (instancetype)imageWithImage:(UIImage *)image leftCapWidth:(NSInteger)width topCapHeight:(NSInteger)height{
    image = [image stretchableImageWithLeftCapWidth:width topCapHeight:height];
    return image;
}

#pragma 根据宽度重新计算图片高度比
- (UIImage *)scaleToWidth:(CGFloat)width {
    
    if (width > self.size.width) {
        return  self;
    }
    
    // 计算缩放之后的高度
    CGFloat height = (width / self.size.width) * self.size.height;
    
    // 初始化要画的大小
    CGRect  rect = CGRectMake(0, 0, width, height);
    
    // 1. 开启图形上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 2. 画到上下文中 (会把当前image里面的所有内容都画到上下文)
    [self drawInRect:rect];
    
    // 3. 取到图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 关闭上下文
    UIGraphicsEndImageContext();
    
    // 5. 返回
    return image;
    
    
}

// CGSize size: 开启一个多大图片的上下文   opaque:不透明度 一般为 NO    CGFloat scale : 要不要缩放 一般为0
+ (UIImage *)setImageAddWatermark:(UIImage *)image
                       imageSize:(CGSize)size
                          opaque:(BOOL)opaque
                           scale:(CGFloat)scale
                    watermarkstr:(NSString *)str
               watermarkstrColor:(UIColor *)strColor
                         strFont:(float)font{
    
    //开始图片上下文
    UIGraphicsBeginImageContextWithOptions(size, opaque,scale);
    
    //把图片添加到图片上下文中
    [image drawAtPoint:CGPointZero];
    
    //绘制文字
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    dict[NSStrokeWidthAttributeName] = @4;
    dict[NSForegroundColorAttributeName] = strColor;
    
    CGFloat str_X = size.width;
    CGFloat str_Y = size.height;
    CGFloat str_w = [NSString setTextSize:str Font:font].width;
    CGFloat str_h = [NSString setTextSize:str Font:font].height;
    
    [str drawAtPoint:CGPointMake(str_X-str_w-5, str_Y-str_h-5) withAttributes:dict];
    
    //生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //手动关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark 裁剪头像
+ (UIImage *)setImageAddCutpicture:(UIImage *)image
                        imageSize:(CGSize)size
                           opaque:(BOOL)opaque
                            scale:(CGFloat)scale
                    newImageWidth:(CGFloat)newimagewidth {
    
    
    UIGraphicsBeginImageContextWithOptions(size, opaque,scale);
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.width)];
    
    //把路径设置成裁剪区域
    [path addClip];
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = [newImage scaleToWidth:newimagewidth];
    UIGraphicsEndImageContext();
    
    
    
    
    return newImage;
    
}


+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW
                      borderColor:(UIColor *)color
                            image:(UIImage *)image
                    newImageWidth:(CGFloat)newimagewidth {
    
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    
    //小圆
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    [path addClip];
    
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = [newImage scaleToWidth:newimagewidth];
    UIGraphicsEndImageContext();

    return newImage;
}

@end
