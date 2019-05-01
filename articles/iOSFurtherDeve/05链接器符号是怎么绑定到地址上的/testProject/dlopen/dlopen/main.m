//
//  main.m
//  dlopen
//
//  Created by 星火教育 on 2019/4/30.
//  Copyright © 2019 星火教育. All rights reserved.
//

// Reference: https://www.exchen.net/ios-hacker-dlopen-%E5%92%8C-dlsym-%E5%8A%A8%E6%80%81%E8%B0%83%E7%94%A8%E5%87%BD%E6%95%B0.html

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <dlfcn.h>

typedef void (*nslog_func_pointer) (NSString * _Nonnull format, ...);

void dynamic_call_function(){
    
    //动态库路径
    char *dylib_path = "/System/Library/Frameworks/Foundation.framework/Foundation";
    
    //打开动态库
    void *handle = dlopen(dylib_path, RTLD_GLOBAL | RTLD_NOW);
    if (handle == NULL) {
        //打开动态库出错
        fprintf(stderr, "%s\n", dlerror());
    } else {
    
        //获取 NSLog 地址 (dlsym：根据返回的动态库地址和函数符号，获取函数地址)
        nslog_func_pointer nslog_func = dlsym(handle, "NSLog");
    
        //地址获取成功则调用
        if (nslog_func) {
            nslog_func(@"log msg successfully");
            nslog_func(@"printf function address 0x%lx\n", nslog_func);
        }
        dlclose(handle); //关闭句柄
    }
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        dynamic_call_function();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


