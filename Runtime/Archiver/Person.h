//
//  Person.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject<NSCoding>

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *age;

- (void)gogogo;

@end
