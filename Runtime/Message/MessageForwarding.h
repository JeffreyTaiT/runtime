//
//  MessageForwarding.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageForwarding : NSObject

- (void)fastForwarding:(NSString *)text;

- (void)normalForwarding:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
