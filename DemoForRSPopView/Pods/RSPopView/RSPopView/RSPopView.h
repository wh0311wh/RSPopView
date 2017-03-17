//
//  RSPopView.h
//  RSWeiBo
//
//  Created by hehai on 3/27/16.
//  Copyright © 2016 hehai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RSLocation) {
    RSLocationLeft = 0,
    RSLocationMiddle,
    RSLocationRight
};

@interface RSPopView : UIImageView

/**
 * 内容视图
 */
@property (nonatomic, weak) UIView *contentView;
/**
 * 底部的button
 */
@property (nonatomic, weak) UIButton *bottomBtn;

/**
 * 设置PopView的位置：左、中、右
 */
@property (nonatomic, assign) RSLocation location;
/**
 * 是否有底部的按钮
 */
@property (nonatomic, assign) BOOL hasBottom;

/**
 * 显示弹出菜单
 */
+ (instancetype)showInRect:(CGRect)rect withLocation:(RSLocation)location;

/**
 * 隐藏弹出菜单
 */
+ (void)hide;

@end
