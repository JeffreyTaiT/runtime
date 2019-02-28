//
//  Header.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Objc/message.h>
#import "UIButton+JFButton.h"
#import "UILabel+JFLabel.h"
#import "Person.h"
#import "Message.h"

#define VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
#define JF_COLOR_A(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB_MS(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define WEAKSELF typeof(self) __weak weakSelf = self;

#endif /* Header_h */
