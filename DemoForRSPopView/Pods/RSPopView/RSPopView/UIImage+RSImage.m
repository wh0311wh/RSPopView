//
//  UIImage+RSImage.m
//  RSWeiBo
//
//  Created by hehai on 1/23/16.
//  Copyright © 2016 hehai. All rights reserved.
//

#import "UIImage+RSImage.h"

@implementation UIImage (RSImage)

+ (instancetype)imageWithOriginalImageNamed:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageWithResizableImageNamed:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat marginH = image.size.width / 2;
    CGFloat marginV = image.size.height / 2;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(marginV, marginH, marginV, marginH) resizingMode:UIImageResizingModeTile];
}

@end
