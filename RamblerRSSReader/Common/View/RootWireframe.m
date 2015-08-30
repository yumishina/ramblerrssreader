//
//  RootWireframe.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "RootWireframe.h"

@interface RootWireframe ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation RootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window{
    self.navigationController = [self navigationControllerFromWindow:window];
    self.navigationController.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

-(void)presentViewController:(UIViewController*) viewController{
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
