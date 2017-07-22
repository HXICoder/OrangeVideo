//
//  BaseNavigationController.m
//  OrangeVideo
//
//  Created by xing on 2017/7/18.
//  Copyright © 2017年 xing. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MainViewController.h"
#import "LiveViewController.h"
#import "RoomViewController.h"

@interface BaseNavigationController () <UINavigationControllerDelegate>

@property (nonatomic,strong) id popGestureRecognizerDelegate;

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (![viewController isKindOfClass:[MainViewController class]] && ![viewController isKindOfClass:[LiveViewController class]]) {
        
        UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] init];
        backBarItem.title = @"返回";
        viewController.navigationItem.backBarButtonItem = backBarItem;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[RoomViewController class]]) { // 禁止侧滑
        self.interactivePopGestureRecognizer.delegate = self.popGestureRecognizerDelegate;
    } else { // 启动侧滑
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

-(BOOL)shouldAutorotate{
    return self.topViewController.shouldAutorotate;
}
/**以下两个方法可不写*/
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}

@end
