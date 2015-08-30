//
//  NewsListWireframe.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListWireframe.h"
#import "NewsListViewController.h"

static NSString* NewsListViewControllerIdentifier = @"NewsListViewController";

@interface NewsListWireframe ()

@property (nonatomic, strong) NewsListViewController *newsListViewController;

@end

@implementation NewsListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window{
    NewsListViewController* newsListViewController = [self newsListViewControllerFromStoryboard];
    newsListViewController.presenter = self.newsListPresenter;
    self.newsListPresenter.userInterface = newsListViewController;
    self.newsListViewController = newsListViewController;
    
    [self.rootWireframe showRootViewController:newsListViewController inWindow:window];
}

- (NewsListViewController *)newsListViewControllerFromStoryboard{
    UIStoryboard *storyboard = [self mainStoryboard];
    NewsListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NewsListViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)mainStoryboard{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

-(void)presentNewsDetailsInterfaceWithTitle:(NSString*) title{
    [self.newsDetailsWireframe presentDetailsInterfaceWithTitle:title];
}

@end
