//
//  RSCover.m
//  RSWeiBo
//
//  Created by hehai on 3/6/16.
//  Copyright © 2016 hehai. All rights reserved.
//

#import "RSCover.h"

#define RSKeyWindow [UIApplication sharedApplication].keyWindow

@implementation RSCover

// 设置浅灰色蒙板
- (void)setDimBackground:(BOOL)dimBackground {
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    } else {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 1;
    }
}

// 创建蒙板
+ (instancetype)show {
    RSCover *cover = [[RSCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    
    [RSKeyWindow addSubview:cover];
    
    return cover;
}

// 点击蒙板的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 移除蒙板
    [self removeFromSuperview];
    // 通知代理移除菜单
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [_delegate coverDidClickCover:self];
    }
}

@end
