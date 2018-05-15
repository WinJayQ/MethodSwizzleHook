//
//  WJHook.m
//  WJHook
//
//  Created by zhihuishequ on 2018/5/16.
//  Copyright © 2018年 WinJayQ. All rights reserved.
//

#import "WJHook.h"
#import <objc/message.h>

@implementation WJHook

+(void)load{
    //拿到微信的注册方法
    Method oldMethod = class_getInstanceMethod(objc_getClass("WCAccountLoginControlLogic"), @selector(onFirstViewRegester));
    //增加自己的方法
    Method newMethod = class_getInstanceMethod(self, @selector(myTest));
    //交换
    method_exchangeImplementations(oldMethod, newMethod);
}

-(void)myTest{
    NSLog(@"检测到异常！不能注册！😝😝😝  --WinJayQ");
}

@end





