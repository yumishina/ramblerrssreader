//
//  NewsDetailsWireframe.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsDetailsWireframe.h"
#import "NewsDetailsViewController.h"

static NSString* NewsDetailsViewControllerIdentifier = @"NewsDetailsViewController";

@interface NewsDetailsWireframe ()

@property (nonatomic, strong) NewsDetailsViewController *newsDetailsViewController;

@end

@implementation NewsDetailsWireframe

- (void)presentDetailsInterfaceWithTitle:(NSString*)title{
    NewsDetailsViewController* newsDetailsViewController = [self newsDetailsViewControllerFromStoryboard];
    newsDetailsViewController.presenter = self.newsDetailsPresenter;
    self.newsDetailsPresenter.userInterface = newsDetailsViewController;
    self.newsDetailsViewController = newsDetailsViewController;
    self.newsDetailsViewController.titleNews = title;
    
    [self.rootWireframe presentViewController: newsDetailsViewController];
}

- (NewsDetailsViewController *)newsDetailsViewControllerFromStoryboard{
    UIStoryboard *storyboard = [self mainStoryboard];
    NewsDetailsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NewsDetailsViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)mainStoryboard{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return storyboard;
}

@end
