//
//  NewsListPresenter.m
//  RamblerRSSReader
//
//  Created by Юлия on 26.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListPresenter.h"
#import "NewsListDataCollector.h"

@implementation NewsListPresenter

#pragma mark - NewsListInteractorOutput
-(void)foundNewsItems:(NSArray *)foundItems{
    [self.userInterface stopLoading];
    if (foundItems.count) {
        NewsListDataCollector* newsListDataCollector = [NewsListDataCollector new];
        [self.userInterface showNewsData:[newsListDataCollector convertNewsList:foundItems]];
    }else{
        [self.userInterface showNoNewsMessage];
    }
}

#pragma mark - NewsListModuleInterface
-(void)loadNewsList{
    [self.newsListInteractor findAllNews];
}

-(void)newsItemSelectedWithTitle:(NSString *)title{
    [self.wireframe presentNewsDetailsInterfaceWithTitle:title];
}

@end
