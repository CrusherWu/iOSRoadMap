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

##### 3.数学函数
round 如果参数是小数，则求本身的四舍五入.

ceil  如果参数是小数，则求最小的整数但不小于本身. (从名字也可以看出来，ceil 是天花板的意思，也就是取他的最近的最大值整数

floor 如果参数是小数，则求最大的整数但不大于本身. ( 是地板的意思，也就是取他的最近的最小整数

Example:如何值是3.4的话，则

-- round 3.000000

-- ceil 4.000000

-- floor 3.00000


