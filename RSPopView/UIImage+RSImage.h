//
//  UIImage+RSImage.h
//  RSWeiBo
//
//  Created by hehai on 1/23/16.
//  Copyright © 2016 hehai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RSImage)

/**
 * instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象。
 */

/**
 * 返回带有本身颜色的Image
 */
+ (instancetype)imageWithOriginalImageNamed:(NSString *)imageName;

/**
 * 返回切分好的Image
 */
+ (instancetype)imageWithResizableImageNamed:(NSString *)imageName;

@end
