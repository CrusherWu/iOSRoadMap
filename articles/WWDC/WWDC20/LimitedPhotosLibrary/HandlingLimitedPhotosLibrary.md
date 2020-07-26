### Handling Limited Photos Library

##### 1.是什么？

通过limited session 去读取数据，而不是直接读/写 data library。

##### 2.如何再次添加资源？

+ 通过设置，找到对应的 APP 来进行添加
+ 通过进程的方式，每次后台杀掉进程，重启APP就可以再次出现弹框。
+ App  添加按钮，给用户提供选择是否需要添加新的照片

##### 3.如何适配 iOS14？

1）通过使用 PHPicker

+ 代替 UIImagePickController
+ 支持多选
+ 不用请求照片访问权限

##### 4.APP功能分类

1）只需要“写”APP

+ 需要保存社交媒体照片的
+ 简易的相机

2）需要获得全部权限的app

+ 浏览
+ 备份
+ 编辑
+ 相册

##### 5.请求相册权限

1）新增：Limited

2）PHAccessLevel

+ Add only (Limited Library 对其不影响)
+ Read / write

##### 6.处理UI

1）禁止自动弹出限制相册选择提示：Info.plist 添加 **PHPhotoLibraryPreventAutomaticLimitedAccessAlert**



Reference:

1.[seesion](https://developer.apple.com/wwdc20/10641)

2.[Handle the Limited Photos Library in your app](https://mackuba.eu/notes/wwdc20/handle-the-limited-photos-library/)

