//
//  AppDelegate.m
//  CapturedCrash
//
//  Created by 星火教育 on 2019/5/11.
//  Copyright © 2019 星火教育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    NSTimer *_timer;
    NSInteger _count;
}

@property (nonatomic, assign) UIBackgroundTaskIdentifier bgIdentify;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self taskWithMoreThreeMins];
    __weak typeof(self) weakSelf = self;
    self.bgIdentify = [application beginBackgroundTaskWithExpirationHandler:^{
        [weakSelf expirationTask];
    }];
}

- (void)taskWithMoreThreeMins{
    NSLog(@"%s",__func__);
    _count = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

- (void)timer{
    _count++;
    NSLog(@"time:%ld",_count);
}

- (void)expirationTask{
    
    NSArray *satck = [NSThread callStackSymbols];
    NSLog(@"thread stack trace:%@",satck);

    [[UIApplication sharedApplication] endBackgroundTask:self.bgIdentify];
    self.bgIdentify = UIBackgroundTaskInvalid;
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
