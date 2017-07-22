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
    [self addChildViewController:[[MainViewController alloc] init] title:@"首页" imageName:@"tab_home" imageNameSel:@"tab_home_s"];
    
    [self addChildViewController:[[LiveViewController alloc] init] title:@"直播" imageName:@"tab_home" imageNameSel:@"tab_home_s"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName imageNameSel:(NSString *)imageNameSel {
    childController.navigationItem.title = title;
    
    BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:childController];
    navVC.tabBarItem.title = title;
    navVC.tabBarItem.image = [UIImage imageNamed:imageName];
    navVC.tabBarItem.selectedImage = [UIImage imageNamed:imageNameSel];
    
    [self addChildViewController:navVC];
}

-(BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.selectedViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return self.selectedViewController.preferredInterfaceOrientationForPresentation;
}

@end
