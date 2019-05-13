#### 13 | 使用 RunLoop 原理监控卡顿

##### 1.RunLoop 概念

[runloop](<https://github.com/CrusherWu/iOSRoadMap/blob/master/articles/runloop/runloop.md>)

##### 2.如何监督卡顿

RunLoop  监听卡顿需要关注两个状态，即是进入睡眠之前和被唤醒之后，分别是 kCFRunLoopBeforeSources 和 kCFRunLoopAfterWaiting。



[RunLoop的应用场景](<http://hl1987.com/2018/04/27/RunLoop%E6%80%BB%E7%BB%93%EF%BC%9ARunLoop%E7%9A%84%E5%BA%94%E7%94%A8%E5%9C%BA%E6%99%AF%EF%BC%88%E5%9B%9B%EF%BC%89App%E5%8D%A1%E9%A1%BF%E7%9B%91%E6%B5%8B/>)

