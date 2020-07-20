## Objective-C tips and tricks

##### 1.OC 泛型：__kindof

使用 __kindof 修饰，不必使用 id，并进行强制转换，只要类型为所指定的类型的子类或是父类即可。

```objective-c
@property (nonatomic, readonly, copy) NSArray<__kindof UIView *> *subviews;

UIButton *button = view.subviews.lastObject;
```



##### 2.UITraitCollection
1.系统特征变化可以通过 [UITraitCollection](https://developer.apple.com/documentation/uikit/uitraitcollection) 来得到：系统暗黑模式切换，字体大小，横竖屏。。。
2.[UIImageAsset](https://developer.apple.com/documentation/uikit/uiimageasset) 和 UITraitCollection 的结合，能为同一视图根据不同特征来显示不同内容：例如 button 在浅色模式显示imgOne,在深色模式显示 imgTwo.

