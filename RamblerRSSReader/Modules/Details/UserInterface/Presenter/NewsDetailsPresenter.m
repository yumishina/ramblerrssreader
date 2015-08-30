//
//  NewsDetailsPresenter.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsDetailsPresenter.h"
#import "NewsItem.h"

@implementation NewsDetailsPresenter

#pragma mark - NewsDetailsInteractorOutput
-(void)foundNewsDetails:(NewsItem*)newsItem{
    [self.userInterface setTitle: newsItem.newsTitle];
    [self.userInterface setPicture: newsItem.newsImageUrl];
    [self.userInterface setDescription: newsItem.newsDescription];
}


#pragma mark - NewsDetailsModuleInterface
-(void)loadNewsDetailsWithTitle:(NSString*)title{
    [self.detailsInteractor findNewsDetails:title];
}

@end
