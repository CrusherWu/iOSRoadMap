#### 利用 Clang 为 APP 提质

问题

>1.clang 主要工作？
>
>[参考](<https://www.jianshu.com/p/9fc7776cce9b>)

Clang 为一些需要分析词法，语法的工具提供基础设置，分别是： LibClang, Clang Plugin, LibTooling.

|              |                                              |                                                              |
| ------------ | -------------------------------------------- | ------------------------------------------------------------ |
| LibClang     | 语法分析，分析语法树，遍历语法树的每一个节点 | [GitHub - macmade/ClangKit: ClangKit provides an Objective-C frontend to LibClang. Source tokenization, diagnostics and fix-its are actually implemented.](https://link.jianshu.com?t=https://github.com/macmade/ClangKit) 。 |
| Clang Plugin | 编写插件，对编译进行控制                     | 1. [JSPatch实现原理详解 « bang’s blog](https://link.jianshu.com/?t=http://blog.cnbang.net/tech/2808/) <br />2.[DynamicCocoa：滴滴 iOS 动态化方案的诞生与起航](https://link.jianshu.com/?t=http://mp.weixin.qq.com/s/qRW_akbU3TSd0SxpF3iQmQ)<br />3. [OCS——史上最疯狂的iOS动态化方案 - 简书](https://www.jianshu.com/p/6c756ce76758)<br />4.[《基于clang插件的一种iOS包大小瘦身方案》](https://link.jianshu.com/?t=http://mp.weixin.qq.com/s?__biz=MzA3ODg4MDk0Ng==&mid=2651112856&idx=1&sn=b2c74c62a10b4c9a4e7538d1ad7eb739) |
| LibTooling   | 可以完全控制语法树                           | 链接：https://www.jianshu.com/p/9fc7776cce9b[Tutorial for building tools using LibTooling and LibASTMatchers — Clang 4.0 documentation](https://link.jianshu.com/?t=http://clang.llvm.org/docs/LibASTMatchersTutorial.html) |

1.dSYM 文件

