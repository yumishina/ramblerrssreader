//
//  AppDependencies.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "AppDependencies.h"
#import "RootWireframe.h"
#import "NewsListWireframe.h"
#import "NewsListPresenter.h"
#import "NewsListInteractor.h"
#import "NewsDetailsWireframe.h"
#import "NewsDetailsPresenter.h"
#import "NewsDetailsInteractor.h"

@interface AppDependencies ()

@property (nonatomic, strong) NewsListWireframe* newsListWireframe;

@end

@implementation AppDependencies


-(instancetype)init{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

-(void)installRootViewControllerIntoWindow:(UIWindow *)window{
    [self.newsListWireframe presentListInterfaceFromWindow: window];
}

-(void)configure{
    
    //Root
    RootWireframe* rootWireframe = [RootWireframe new];
    
    //NewsList
    NewsListWireframe* newsListWireframe = [NewsListWireframe new];
    NewsListPresenter* newsListPresenter = [NewsListPresenter new];
    NewsListInteractor* newsListInteractor = [NewsListInteractor new];
    
    //NewsDetails
    NewsDetailsWireframe* newsDetailsWireframe = [NewsDetailsWireframe new];
    NewsDetailsPresenter* newsDetailsPresenter = [NewsDetailsPresenter new];
    NewsDetailsInteractor* newsDetailsInteractor = [NewsDetailsInteractor new];
    
    //NewsList configure
    newsListInteractor.output = newsListPresenter;
    newsListPresenter.newsListInteractor = newsListInteractor;
    newsListPresenter.wireframe = newsListWireframe;
    newsListWireframe.newsDetailsWireframe = newsDetailsWireframe;
    newsListWireframe.newsListPresenter = newsListPresenter;
    newsListWireframe.rootWireframe = rootWireframe;
    self.newsListWireframe = newsListWireframe;
    
    //NewsDetails configure
    newsDetailsInteractor.output = newsDetailsPresenter;
    newsDetailsPresenter.detailsInteractor = newsDetailsInteractor;
    newsDetailsWireframe.newsDetailsPresenter = newsDetailsPresenter;
    newsDetailsWireframe.rootWireframe = rootWireframe;
    
}

@end
