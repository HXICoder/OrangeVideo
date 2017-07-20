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
#import "LiveViewController.h"

@interface HXTabBarController ()

@end

@implementation HXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    UINavigationController * nav1 = [self addChildViewController:[[MainViewController alloc] init] title:@"首页" imageName:@"tab_home" imageNameSel:@"tab_home_s"];
    
    UINavigationController * nav2 = [self addChildViewController:[[LiveViewController alloc] init] title:@"直播" imageName:@"tab_home" imageNameSel:@"tab_home_s"];
    
    [self setViewControllers:@[nav1, nav2]];
}

- (UINavigationController *)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName imageNameSel:(NSString *)imageNameSel {
    childController.navigationItem.title = title;
    
    BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:childController];
    navVC.tabBarItem.title = title;
    navVC.tabBarItem.image = [UIImage imageNamed:imageName];
    navVC.tabBarItem.selectedImage = [UIImage imageNamed:imageNameSel];
    
    return navVC;
//    [self addChildViewController:navVC];
}

@end
