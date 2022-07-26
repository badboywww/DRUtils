//
//  UIView+CALayer.h
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CALayer)

#pragma mark 视图动画
/**
    图标抖动
 */
+ (CAAnimation *)setTranslationView:(UIView *)view;

/**
    图标按线运动
 */
+ (CAAnimation *)setLineView:(UIView *)view
                           X:(CGFloat)x
                           Y:(CGFloat)y
                           W:(CGFloat)w
                           H:(CGFloat)h;


/**
 转场动画:
 */
+ (CATransition *)setTransitionAnimationImageView:(UIImageView *)imageVc
                                       imageArray:(NSMutableArray *)ArrVc
                                    animationType:(NSString *)type
                                 animationSubtype:(NSString *)subtype;

@end

NS_ASSUME_NONNULL_END
