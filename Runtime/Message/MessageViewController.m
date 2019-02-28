//
//  MessageViewController.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "MessageViewController.h"
#import "Header.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self sendMessage];
    
    [self resolutionMessage];
    
    [self fastForwarding];
    
    [self normalForwarding];
}

///正常情况下的函数调用
- (void)sendMessage{
    Message *message = [Message new];
    [message sendMessage:@"normal"];
}

///Method Resolution
- (void)resolutionMessage{
    Message *message = [Message new];
    [message resolutionMessage:@"resolution"];
}

///Fast Forwarding
- (void)fastForwarding{
    Message *message = [Message new];
    [message fastForwarding:@"fastForwarding"];
}

///Normal Forwarding
- (void)normalForwarding{
    Message *message = [Message new];
    [message normalForwarding:@"normalForwarding"];
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
