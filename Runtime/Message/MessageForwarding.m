//
//  MessageForwarding.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "MessageForwarding.h"

@implementation MessageForwarding

- (void)fastForwarding:(NSString *)text{
    NSLog(@"fast forwarding way : send message = %@", text);
}

- (void)normalForwarding:(NSString *)text{
    NSLog(@"normal forwarding way : send message = %@", text);
}

@end
