//
//  ViewController.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/26.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "AssociatedController.h"
#import "ArchiverViewController.h"
#import "MessageViewController.h"
#import "ExchangeViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}

- (void)initView{
    
    UIButton *associaButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, (VIEW_HEIGHT - 50)/2 - 150, 100, 50)];
    [associaButton setTitle:@"关联对象" forState:UIControlStateNormal];
    [associaButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    associaButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [associaButton addTarget:self action:@selector(gotoAssociaVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:associaButton];
    
    UIButton *archiverButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(associaButton.frame) + 50, 100, 50)];
    [archiverButton setTitle:@"归档" forState:UIControlStateNormal];
    [archiverButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    archiverButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [archiverButton addTarget:self action:@selector(gotoArchiverVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:archiverButton];
    
    UIButton *messageButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(archiverButton.frame) + 50, 100, 50)];
    [messageButton setTitle:@"消息转发" forState:UIControlStateNormal];
    [messageButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    messageButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [messageButton addTarget:self action:@selector(gotoMessageVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messageButton];
    
    UIButton *exchangeButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(messageButton.frame) + 50, 100, 50)];
    [exchangeButton setTitle:@"函数替换" forState:UIControlStateNormal];
    [exchangeButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    exchangeButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [exchangeButton addTarget:self action:@selector(gotoExchageVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exchangeButton];
}

- (void)gotoAssociaVC{
    AssociatedController *ass_vc = [[AssociatedController alloc] init];
    
    [self.navigationController pushViewController:ass_vc animated:YES];
}

- (void)gotoArchiverVC{
    ArchiverViewController *arc_vc = [[ArchiverViewController alloc] init];
    
    [self.navigationController pushViewController:arc_vc animated:YES];
}

- (void)gotoMessageVC{
    MessageViewController *mes_vc = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:mes_vc animated:YES];
}

- (void)gotoExchageVC{
    ExchangeViewController *exc_vc = [[ExchangeViewController alloc] init];
    [self.navigationController pushViewController:exc_vc animated:YES];
}

@end
