# MethodSwizzleHook
iOS逆向之Method Swizzle

题外话：此教程是一篇严肃的学术探讨类文章，仅仅用于学习研究，也请读者不要用于商业或其他非法途径上，笔者一概不负责哟~~
##准备工作
* 非越狱的iPhone手机
* 用PP助手下载： 微信6.6.5(越狱应用)
* MachOView
* yololib
* class-dump
* 学习这篇文章之前应该要对runtime有些了解，参考：https://www.jianshu.com/p/927c8384855a
* 参考[iOS逆向之代码注入(dylib)](https://www.jianshu.com/p/41482f671ca6)新建工程，注入代码

##目的：破坏微信注册功能

##思路：
1. 动态调试找到注册按钮
2. 找到对应的方法
3. 修改并交换方法
##步骤：
###1. 点击Debug view
![image.png](https://upload-images.jianshu.io/upload_images/1013424-4b0ec5d827439ce2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###2. 点击注册，找到类名(WCAccountLoginControlLogic)和方法名(onFirstViewRegester)
![image.png](https://upload-images.jianshu.io/upload_images/1013424-1cd53c9fd44eb0d9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###3. 导出头文件，用到class-dump
![image.png](https://upload-images.jianshu.io/upload_images/1013424-b68598d082eb39f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/1013424-e1fde01350b7ae1a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```class-dump -H Wechat -o /Users/zhihuishequ/Desktop/WeChatHearder/```

导出头文件，查找@interface WCAccountLoginControlLogic 
![image.png](https://upload-images.jianshu.io/upload_images/1013424-52beed3e06118829.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
在该类中找到方法onFirstViewRegester
![image.png](https://upload-images.jianshu.io/upload_images/1013424-7e8d1e96a7c27165.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###4. 编写WJHook的代码
![image.png](https://upload-images.jianshu.io/upload_images/1013424-6f02fa3f477e97e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###5. 编译运行，当点击注册按钮时，会打印WJHook的NSLog。
![image.png](https://upload-images.jianshu.io/upload_images/1013424-ce21708f9e3610be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




