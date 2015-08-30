//
//  NewsDetailsInteractor.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsDetailsInteractor.h"
#import "NewsItemsDataStore.h"
#import "NewsItem.h"

@implementation NewsDetailsInteractor

#pragma mark - NewsDetailsInteractorInput
-(void)findNewsDetails:(NSString *)title{
    NewsItem* news = [[NewsItemsDataStore sharedInstance] findNewsItemByTitle: title];
    [self.output foundNewsDetails: news];
}

@end
