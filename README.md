## RSPopView
自己封装的PopView控件

## 使用方法

将RSPopView文件夹中的5个文件导入工程，在需要用到PopView的控制器中导入头文件：
```objective-c
#import "RSPopViewHeader.h"
```

遵守<RSCoverDelegate>协议

实现协议方法（点击蒙板的时候调用）：
```objective-c
- (void)coverDidClickCover:(RSCover *)cover {
    [RSPopView hide];
    _titleBtn.selected = NO;
}
```

在点击触发弹出PopView的方法中，执行下边方法中的内容（方法名仅为示例）
```objective-c
- (void)clickTitleView:(RSTitleView *)titleView {
	// 创建蒙板
    RSCover *cover = [RSCover show];
    cover.delegate = self;
    
 	// 创建弹出视图
    CGFloat popW = 180;
    CGFloat popH = 300;
    CGFloat popX = (self.view.width - popW) * 0.5;
    CGFloat popY = 55;
    RSPopView *menu = [RSPopView showInRect:CGRectMake(popX, popY, popW, popH) withLocation:RSLocationMiddle];
	
	// 创建PopView底部的button，如果不需要，可以不设置，默认为nil
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"编辑我的分组" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editGroup:) forControlEvents:UIControlEventTouchUpInside];
    menu.bottomBtn = btn;
    
	// 设置内容视图
    menu.contentView = self.one.view;
}
```
## 作者信息
hehai（hehai682@126.com）


