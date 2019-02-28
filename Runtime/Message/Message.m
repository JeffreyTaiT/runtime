//
//  Message.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "Message.h"
#import "MessageForwarding.h"
#import <objc/runtime.h>

@implementation Message

#pragma mark- 正常情况下的函数调用
- (void)sendMessage:(NSString *)text{
    
    NSLog(@"normal way : send message = %@", text);
}

#pragma mark- Method Resolution
//- (void)resolutionMessage:(NSString *)text{
//
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(resolutionMessage:)) {
        Method addM = class_getInstanceMethod([self class], @selector(add_resolutionMessage:));
        class_addMethod([self class], sel, class_getMethodImplementation(self, @selector(add_resolutionMessage:)),method_getTypeEncoding(addM));
    }
//    if (sel == @selector(sendMessage:)) {
//        class_addMethod([self class], sel, imp_implementationWithBlock(^(id self, NSString *word) {
//            NSLog(@"method resolution way : send message = %@", word);
//        }), "v@*");
//    }
    return YES;
}

- (void)add_resolutionMessage:(NSString *)text {
    NSLog(@"666转发了消息666");
    NSLog(@"resolution way :send message = %@",text);
}


#pragma mark- Fast Forwarding
//- (void)fastForwarding:(NSString *)text{
//
//
//}
- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(fastForwarding:)) {
        return [MessageForwarding new];
    }
    return nil;
}

#pragma mark- Normal Forwarding
//- (void)normalForwarding:(NSString *)text{
//
//}

//获取函数参数和返回值
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    MessageForwarding *mess = [MessageForwarding new];
    
    if ([mess respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:mess];
    }
}
@end
