//
//  UIButton+JFButton.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//  添加关联方法

/*
 设置关联对象关键key，一共有三种写法:
 
 (1)静态变量&btnKey
 
 (2)@selector(methodName)
 
 (3)_cmd
 
 */

#import "UIButton+JFButton.h"
#import <Objc/runtime.h>

static NSString *keyOfMethod;
static NSString *keyOfBlock;

@implementation UIButton (JFButton)

/**
 objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 
  id object                     :表示关联者，是一个对象，变量名理所当然也是object
 
  const void *key               :获取被关联者的索引key
 
  id value                      :被关联者，这里是一个block
 
  objc_AssociationPolicy policy : 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
 */
+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock{
    UIButton *button = [[UIButton alloc]init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    objc_setAssociatedObject(button, &keyOfMethod, actionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject (button , @selector(buttonClick:), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}


- (void)buttonClick:(UIButton *)button{
    
    //通过key获取被关联对象
    ActionBlock block1 = (ActionBlock)objc_getAssociatedObject(button, @selector(buttonClick:));
    if(block1){
        block1(button);
    }
    
    ActionBlock block2 = (ActionBlock)objc_getAssociatedObject(button, &keyOfBlock);
    if(block2){
        block2(button);
    }
}

- (void)setActionBlock:(ActionBlock)actionBlock{
    objc_setAssociatedObject (self, &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)actionBlock{
    return objc_getAssociatedObject (self ,&keyOfBlock);
}



@end
