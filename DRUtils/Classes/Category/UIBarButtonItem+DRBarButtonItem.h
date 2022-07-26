//
//  UIBarButtonItem+DRBarButtonItem.h
//  DRUtils
//
//  Created by DevWang on 2022/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (DRBarButtonItem)

+ (instancetype) itemWithImageName:(UIImage *)image
                     highImageName:(UIImage *)highimage
                            target:(nullable id)target
                            action:(nullable SEL)action;

+ (instancetype) itemWithImageName:(UIImage *)image
                   selectImageName:(UIImage *)Selectimage
                            target:(nullable id)target
                            action:(nullable SEL)action;

@end

NS_ASSUME_NONNULL_END
