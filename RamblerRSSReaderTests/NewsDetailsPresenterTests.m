//
//  NewsDetailsPresenterTests.m
//  RamblerRSSReader
//
//  Created by Юлия on 30.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsDetailsPresenter.h"
#import "NewsDetailsViewInterface.h"
#import "NewsItem.h"

@interface NewsDetailsPresenterTests : XCTestCase

@property(nonatomic, strong) NewsDetailsPresenter* newsDetailsPresenter;
@property (nonatomic, strong) id userInterface;
@end


@implementation NewsDetailsPresenterTests
- (void)setUp {
    [super setUp];
    self.newsDetailsPresenter = [NewsDetailsPresenter new];
    self.userInterface = [OCMockObject mockForProtocol:@protocol(NewsDetailsViewInterface)];
    self.newsDetailsPresenter.userInterface = self.userInterface;
}

- (void)tearDown {
    [self.userInterface verify];
    [super tearDown];
}

- (void)testFoundNewsDetails {
    NewsItem* news = [NewsItem new];
    news.newsTitle = @"News";
    news.newsImageUrl = @"http://rambler.ru";
    news.newsDescription = @"Good news";
    
    [[self.userInterface expect] setTitle: news.newsTitle];
    [[self.userInterface expect] setPicture: news.newsImageUrl];
    [[self.userInterface expect] setDescription: news.newsDescription];
    [self.newsDetailsPresenter foundNewsDetails:news];
}


@end