//
//  UIViewController+Logging.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/runtime.h>

@implementation UIViewController (Logging)

+ (void)load{
    swizzleMethod(self.class, @selector(viewWillAppear:), @selector(jf_viewWillAppear:));
}

- (void)jf_viewWillAppear:(BOOL)animated{
    
    [self jf_viewWillAppear:animated];
    
    NSLog(@"当前VC---%@", NSStringFromClass([self class]));
}

void swizzleMethod(Class class,SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
