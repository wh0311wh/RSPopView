## RSPopView
自己封装的PopView控件

## 实际使用效果图
中间
![Mou icon](https://github.com/riversea2015/RSPopView/blob/master/ScreenShot/shot1.png?raw=true)
右侧
![Mou icon](https://github.com/riversea2015/RSPopView/blob/master/ScreenShot/shot2.png?raw=true)
左侧
![Mou icon](https://github.com/riversea2015/RSPopView/blob/master/ScreenShot/shot3.png?raw=true)

## 使用方法
1.导入

第一种方法：使用 CocoaPods 导入，Podfiles中可以这样写：

```objective-c
pod 'RSPopView', '~> 0.0.3'
```
但是导入头文件时，需要使用导入系统头文件的方法

```objective-c
#import <RSPopView/RSPopViewHeader.h>
```

第二种方法；直接将RSPopView文件夹中的多个文件拖到工程里，在需要用到PopView的控制器中导入头文件：

```objective-c
#import "RSPopViewHeader.h"
```
2.使用

遵守协议：
```objective-c
<RSCoverDelegate>
}
```

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
## 作者信息：

he hai, hehai682@126.com

## License：

RSPopView is available under the MIT license. See the LICENSE file for more info.
