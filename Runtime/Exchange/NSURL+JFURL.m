//
//  NSURL+JFURL.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "NSURL+JFURL.h"
#import "Objc/runtime.h"

@implementation NSURL (JFURL)

+(void)load{
    
    Method urlMethod = class_getClassMethod(self, @selector(URLWithString:));
    Method jfUrlMethod = class_getClassMethod(self, @selector(JFURLWithString:));
    
    method_exchangeImplementations(urlMethod, jfUrlMethod);
}

+ (nullable instancetype)JFURLWithString:(NSString *)URLString{
    
    NSURL *url = [NSURL JFURLWithString:URLString];
    if (url == nil) {
        NSLog(@"url为空");
    }
    return url;
}

@end
