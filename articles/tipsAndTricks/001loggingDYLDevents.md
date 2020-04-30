设置变量打印 pre-main 时间；加载了哪些 dylibs...

 *DYLD*_PRINT_STATISTICS，来在控制台打印出程序启动过程中各个阶段所消耗的时间。今天再分享两个环境变量：*DYLD*_PRINT_LIBRARIES 和 *DYLD*_PRINT_LIBRARIES_POST_LAUNCH，这两个变量用于打印 *dyld* 加载的

两者的区别在于 *DYLD*_PRINT_LIBRARIES 会打印出所有被加载的库，而 *DYLD*_PRINT_LIBRARIES_POST_LAUNCH 打印的是通过 dlopen 调用返回的库，包括动态库的依赖库，主要发生在 main 函数运行之后。

[Logging Dynamic Loader Events](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/LoggingDynamicLoaderEvents.html)

