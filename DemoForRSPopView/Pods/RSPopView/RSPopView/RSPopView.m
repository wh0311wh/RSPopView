//
//  RSPopView.m
//  RSWeiBo
//
//  Created by hehai on 3/27/16.
//  Copyright © 2016 hehai. All rights reserved.
//

#import "RSPopView.h"
#import "UIImage+RSImage.h"

#define BottomBtnH 30
#define RSKeyWindow [UIApplication sharedApplication].keyWindow

@implementation RSPopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // ...
        
    }
    return self;
}

// 创建并显示
+ (instancetype)showInRect:(CGRect)rect withLocation:(RSLocation)location {
    RSPopView *menu = [[self alloc] initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    
    switch (location) {
        case RSLocationLeft:
            menu.image = [UIImage imageWithResizableImageNamed:@"popover_background_left"];
            break;
        case RSLocationMiddle:
            menu.image = [UIImage imageWithResizableImageNamed:@"popover_background"];
            break;
        case RSLocationRight:
            menu.image = [UIImage imageWithResizableImageNamed:@"popover_background_right"];
            break;
        default:
            break;
    }
    
    [RSKeyWindow addSubview:menu];
    return menu;
}

// 隐藏
+ (void)hide {
    for (UIView *popMenu in RSKeyWindow.subviews) {
        if ([popMenu isKindOfClass:[self class]]) {
            [popMenu removeFromSuperview];
        }
    }
}

// 设置内容视图
- (void)setContentView:(UIView *)contentView {
    // 先移除之前的内容视图
    [_contentView removeFromSuperview];
    
    _contentView = contentView;
    contentView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:contentView];
}

// 设置底部视图
- (void)setBottomBtn:(UIButton *)bottomBtn {
    _bottomBtn = bottomBtn;
    
    [bottomBtn setBackgroundImage:[UIImage imageWithResizableImageNamed:@"popover_button"] forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self addSubview:bottomBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 计算内容视图尺寸
    CGFloat margin = 5;
    CGFloat y = 9 + margin;
    CGFloat x = margin;
    CGFloat w = self.frame.size.width - 2 * margin;
    CGFloat h = self.frame.size.height - y - 2 * margin;
    
    if (self.bottomBtn) { // 如果存在底部按钮
        h -= BottomBtnH;
    }
    _contentView.frame = CGRectMake(x, y, w, h);
    
    if (!self.bottomBtn) {
        return;
    }
    
    // 计算popView底部按钮的尺寸
    CGFloat BottomBtnW = w - 2 * margin;
    CGFloat BottomBtnX = x + margin;
    CGFloat BottomBtnY = self.frame.size.height - BottomBtnH  - 7;
    _bottomBtn.frame = CGRectMake(BottomBtnX, BottomBtnY, BottomBtnW, BottomBtnH);
}

@end
