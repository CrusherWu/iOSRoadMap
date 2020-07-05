## Objective-C tips and tricks

##### 1.OC 泛型：__kindof

使用 __kindof 修饰，不必使用 id，并进行强制转换，只要类型为所指定的类型的子类或是父类即可。

```objective-c
@property (nonatomic, readonly, copy) NSArray<__kindof UIView *> *subviews;

UIButton *button = view.subviews.lastObject;
```



##### 2.

