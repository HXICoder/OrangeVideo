//
//  TestViewController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/19.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 60, 40);
    [button addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}

- (void)btnClicked {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
