####Dyld链接过程 

[所需文件](./testFile)

1.编译多个文件

```
xcrun clang -c Boy.m
xcrun clang -c SayHi.m
```



2.将编译的文件链接起来，形成连接后可执行文件 a.out

```objective-c
xcrun clang SayHi.o Boy.o -Wl,`xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation

```



3.使用 nm 查看编译后的文件符号：

SayHi.o

```objective-c
nideiPad:test xinghuojiaoyu$ xcrun nm -nm SayHi.o
                 (undefined) external _OBJC_CLASS_$_Boy
                 (undefined) external _objc_autoreleasePoolPop
                 (undefined) external _objc_autoreleasePoolPush
                 (undefined) external _objc_msgSend
0000000000000000 (__TEXT,__text) external _main
```

Boy.o

```
nideiPad:test xinghuojiaoyu$ xcrun nm -nm Boy.o
                 (undefined) external _NSLog
                 (undefined) external _OBJC_CLASS_$_NSObject
                 (undefined) external _OBJC_METACLASS_$_NSObject
                 (undefined) external ___CFConstantStringClassReference
                 (undefined) external __objc_empty_cache
0000000000000000 (__TEXT,__text) non-external -[Boy say]
0000000000000060 (__DATA,__objc_const) non-external l_OBJC_METACLASS_RO_$_Boy
00000000000000a8 (__DATA,__objc_const) non-external l_OBJC_$_INSTANCE_METHODS_Boy
00000000000000c8 (__DATA,__objc_const) non-external l_OBJC_CLASS_RO_$_Boy
0000000000000110 (__DATA,__objc_data) external _OBJC_METACLASS_$_Boy
0000000000000138 (__DATA,__objc_data) external _OBJC_CLASS_$_Boy

```

查看动态库是通过哪些库来解析符号的：

```
nideiPad:test xinghuojiaoyu$ xcrun nm -nm a.out
                 (undefined) external _NSLog (from Foundation)
                 (undefined) external _OBJC_CLASS_$_NSObject (from libobjc)
                 (undefined) external _OBJC_METACLASS_$_NSObject (from libobjc)
                 (undefined) external ___CFConstantStringClassReference (from CoreFoundation)
                 (undefined) external __objc_empty_cache (from libobjc)
                 (undefined) external _objc_autoreleasePoolPop (from libobjc)
                 (undefined) external _objc_autoreleasePoolPush (from libobjc)
                 (undefined) external _objc_msgSend (from libobjc)
                 (undefined) external dyld_stub_binder (from libSystem)
0000000100000000 (__TEXT,__text) [referenced dynamically] external __mh_execute_header
0000000100000ea0 (__TEXT,__text) external _main
0000000100000f20 (__TEXT,__text) non-external -[Boy say]
0000000100001130 (__DATA,__objc_data) external _OBJC_METACLASS_$_Boy
0000000100001158 (__DATA,__objc_data) external _OBJC_CLASS_$_Boy

```

4.通过 otool 工具来查到链接符号所需要的库在哪

```objective-c
nideiPad:test xinghuojiaoyu$ xcrun otool -L a.out
a.out:
	/System/Library/Frameworks/Foundation.framework/Versions/C/Foundation (compatibility version 300.0.0, current version 1560.12.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.200.5)
	/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation (compatibility version 150.0.0, current version 1560.12.0)
	/usr/lib/libobjc.A.dylib (compatibility version 1.0.0, current version 228.0.0)
```

