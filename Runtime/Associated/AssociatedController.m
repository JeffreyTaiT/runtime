//
//  AssociatedController.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "AssociatedController.h"
#import "Header.h"

static void *myAlertViewKey = &myAlertViewKey;

@interface AssociatedController ()<UIAlertViewDelegate>

@end

@implementation AssociatedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self buttonConfig];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.jf_someKey = @"jf_someValue";
    NSLog(@"label.jfsomeKey = %@",label.jf_someKey);
}

- (void)buttonConfig{
    //第一个按钮
    UIButton *button1 = [UIButton createBtnWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, (VIEW_HEIGHT - 50)/2 - 200, 100, 50) title:@"按钮" actionBlock:^(UIButton *button) {
        float r = (int)(1+(arc4random()%255));
        float g = (int)(1+(arc4random()%255));
        float b = (int)(1+(arc4random()%255));
        [button setBackgroundColor:JF_COLOR_A(r, g, b, 1)];
        
    }];
    button1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button1];
    
    //第二个按钮
    UIButton *button2 = [UIButton createBtnWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(button1.frame) + 50, 100, 50) title:@"按钮2" actionBlock:nil];
    button2.actionBlock = ^(UIButton *button){
        NSLog(@"---%@---",button.currentTitle);
    };
    button2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button2];
    
    //第三个按钮
    UIButton *button3 = [UIButton createBtnWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(button2.frame) + 50, 100, 50) title:@"按钮3" actionBlock:^(UIButton *button) {
        float r = (int)(1+(arc4random()%255));
        float g = (int)(1+(arc4random()%255));
        float b = (int)(1+(arc4random()%255));
        [button setBackgroundColor:JF_COLOR_A(r, g, b, 1)];
    }];
    button3.actionBlock = ^(UIButton *button){
        NSLog(@"---%@---",button.currentTitle);
    };
    button3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button3];
    
    //第四个按钮
    UIButton *button4 = [UIButton createBtnWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(button3.frame) + 50, 100, 50) title:@"按钮4" actionBlock:nil];
    WEAKSELF;
    button4.actionBlock = ^(UIButton *button){
        [weakSelf showAlertView];
    };
    button4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button4];
}

- (void)showAlertView{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    void (^block)(NSInteger) = ^(NSInteger buttonIndex){
        if (buttonIndex == 0) {
            [self doCancel];
        }else{
            [self doContinue];
        }
    };
    
    objc_setAssociatedObject(alert, myAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, myAlertViewKey);
    block(buttonIndex);
}

- (void)doCancel{
    NSLog(@"Cancle");
}

- (void)doContinue{
    NSLog(@"Continue");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
