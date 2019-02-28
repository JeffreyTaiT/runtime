//
//  UILabel+JFLabel.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "UILabel+JFLabel.h"
#import <Objc/runtime.h>

@implementation UILabel (JFLabel)

- (void)setJf_someKey:(id)jf_someKey{
    objc_setAssociatedObject(self, @selector(jf_someKey), jf_someKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)jf_someKey{
    return objc_getAssociatedObject(self, _cmd);
}

@end
