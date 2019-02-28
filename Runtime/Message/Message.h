//
//  Message.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Message : NSObject

///正常情况下的函数调用
- (void)sendMessage:(NSString *)text;

///Method Resolution
- (void)resolutionMessage:(NSString *)text;

///Fast Forwarding
- (void)fastForwarding:(NSString *)text;

///Normal Forwarding
- (void)normalForwarding:(NSString *)text;

@end

