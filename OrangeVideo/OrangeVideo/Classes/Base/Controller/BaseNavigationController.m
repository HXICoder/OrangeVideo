//
//  BaseNavigationController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/18.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] init];
    backBarItem.title = @"返回";
    viewController.navigationItem.backBarButtonItem = backBarItem;
    
    [super pushViewController:viewController animated:animated];
}

@end
