//
//  ArchiverViewController.m
//  Runtime
//
//  Created by Jeffrey on 2019/2/28.
//  Copyright © 2019年 JeffreyTaiT. All rights reserved.
//

#import "ArchiverViewController.h"
#import "Header.h"

@interface ArchiverViewController ()

@end

@implementation ArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self personInit];
    
    UIButton *archiverButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, (VIEW_HEIGHT - 50)/2 - 50, 100, 50)];
    [archiverButton setTitle:@"归档:存" forState:UIControlStateNormal];
    [archiverButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    archiverButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [archiverButton addTarget:self action:@selector(archiverButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:archiverButton];
    
    UIButton *unArchiverButton = [[UIButton alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 100)/2, CGRectGetMaxY(archiverButton.frame) + 50, 100, 50)];
    [unArchiverButton setTitle:@"归档:取" forState:UIControlStateNormal];
    [unArchiverButton setTitleColor:UIColorFromRGB_MS(0x4577dc) forState:UIControlStateNormal];
    unArchiverButton.backgroundColor = UIColorFromRGB_MS(0xf3f3f3);
    [unArchiverButton addTarget:self action:@selector(unArchiverButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:unArchiverButton];
}

- (void)personInit{
    //    正常初始化
    //    Person *p = [[Person alloc] init];//[Person alloc]->[p init]
    
    //    runtime初始化
    //    Person *p = objc_msgSend(Person.class, @selector(alloc));
    //    p = objc_msgSend(p, @selector(init));
    
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    p = objc_msgSend(p, sel_registerName("init"));
    
    
    //    调用方法
    //    1.直接调用
    //    [p gogogo];
    //    2.performSelector调用
    //    [p performSelector:@selector(gogogo) withObject:nil];
    //    3.runtime
    objc_msgSend(p, sel_registerName("gogogo"));
}

- (void)archiverButton{
    //com+shift+G 可查看路径下是否归档成功
    NSLog(@"沙盒地址：\n%@\n",NSTemporaryDirectory());
    //归档
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"jeffrey.plist"];
    Person *p = [[Person alloc] init];
    p.name = @"Jeffrey";
    p.age = @"18";
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

- (void)unArchiverButton{
    //解档
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"jeffrey.plist"];
    
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"\np.name = %@\np.age = %@",p.name,p.age);
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
