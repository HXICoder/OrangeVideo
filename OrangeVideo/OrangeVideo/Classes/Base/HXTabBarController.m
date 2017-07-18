//
//  HXTabBarController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/18.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "HXTabBarController.h"
#import "BaseNavigationController.h"

@interface HXTabBarController ()

@end

@implementation HXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    UIViewController *vc = [[UIViewController alloc] init];
    BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:vc];
    vc.navigationItem.title = @"首页";
    navVC.tabBarItem.title = @"首页";
    [self setViewControllers:@[navVC]];
}

@end
