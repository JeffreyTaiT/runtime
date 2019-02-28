//
//  Person.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "Person.h"
#import "Objc/runtime.h"

@implementation Person

- (void)gogogo{
    NSLog(@"人走起来了");
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
//    [aCoder encodeObject:_name forKey:@"name"];
//    [aCoder encodeObject:_age forKey:@"age"];
    
    unsigned int count = 0;
    Ivar *list = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i<count; i++) {
        Ivar ivar = list[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(list);
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *list = class_copyIvarList(self.class, &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = list[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(list);
    }
    return self;
}

@end
