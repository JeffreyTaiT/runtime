//
//  UIButton+JFButton.h
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(UIButton *button);

@interface UIButton (JFButton)

@property (nonatomic,copy) ActionBlock actionBlock;

+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock;


@end
