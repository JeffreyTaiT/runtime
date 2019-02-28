//
//  NSURL+JFURL.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (JFURL)

+ (nullable instancetype)JFURLWithString:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
