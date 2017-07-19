//
//  HXTabBarController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/18.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "HXTabBarController.h"
#import "BaseNavigationController.h"
#import "MainViewController.h"

@interface HXTabBarController ()

@end

@implementation HXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    MainViewController *mainVC = [[MainViewController alloc] init];
    BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:mainVC];
    mainVC.navigationItem.title = @"首页";

    navVC.tabBarItem.title = @"首页";
    navVC.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    navVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home_s"];
    
    MainViewController *mainVC2 = [[MainViewController alloc] init];
    BaseNavigationController *navVC2 = [[BaseNavigationController alloc] initWithRootViewController:mainVC2];
    mainVC2.navigationItem.title = @"首页";
    
    navVC2.tabBarItem.title = @"首页";
    navVC2.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    navVC2.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home_s"];
    
    [self setViewControllers:@[navVC, navVC2]];
}

@end
