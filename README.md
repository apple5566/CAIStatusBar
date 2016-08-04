# CAIStatusBar
一个简单的状态栏窗口
##显示成功信息
```objc 
[CAIStatusBar showSuccess:@"加载完成"];
```
##显示失败信息
```objc
[CAIStatusBar showErrow:@"加载失败了"];
```
##显示加载信息
```objc
[CAIStatusBar showLoad:@"正在加载中"];
```
##显示隐藏信息
```objc
[CAIStatusBar hide];
```
##显示普通信息
```objc
[CAIStatusBar show:@"牛逼" WithImage:nil];
```