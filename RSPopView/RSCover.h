//
//  RSCover.h
//  RSWeiBo
//
//  Created by hehai on 3/6/16.
//  Copyright © 2016 hehai. All rights reserved.
//  蒙板 --

#import <UIKit/UIKit.h>

@class RSCover;
/**
 * 蒙板的代理
 */
@protocol RSCoverDelegate <NSObject>

@optional
/**
 * 点击蒙板的时候调用
 */
- (void)coverDidClickCover:(RSCover *)cover;

@end

@interface RSCover : UIView

@property (nonatomic, weak) id<RSCoverDelegate> delegate;

/**
 * 设置浅灰色模板
 */
@property (nonatomic, assign) BOOL dimBackground;
/**
 * 显示模板
 */
+ (instancetype)show;

@end
