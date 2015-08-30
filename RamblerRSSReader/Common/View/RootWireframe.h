//
//  RootWireframe.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface RootWireframe : NSObject

-(void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window;
-(void)presentViewController:(UIViewController*) viewController;

@end
