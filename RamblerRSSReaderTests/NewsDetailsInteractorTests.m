//
//  NewsDetailsInteractorTests.m
//  RamblerRSSReader
//
//  Created by Юлия on 30.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsDetailsInteractor.h"
#import "NewsDetailsInteractorIO.h"
#import "NewsItemsDataStore.h"
#import "NewsItem.h"


@interface NewsDetailsInteractorTests : XCTestCase
@property(nonatomic, strong) NewsDetailsInteractor* newsDetailsInteractor;
@property(nonatomic, strong) id output;
@property(nonatomic, strong) id newsItemsDataStore;

@end


@implementation NewsDetailsInteractorTests

- (void)setUp {
    [super setUp];
    
    self.newsDetailsInteractor = [NewsDetailsInteractor new];
    
    self.output = [OCMockObject mockForProtocol:@protocol(NewsDetailsInteractorOutput)];
    self.newsDetailsInteractor.output = self.output;
    
    self.newsItemsDataStore = [OCMockObject niceMockForClass:[NewsItemsDataStore class]];
    [[[self.newsItemsDataStore stub] andReturn:self.newsItemsDataStore] sharedInstance];
}

- (void)tearDown {
    [self.newsItemsDataStore verify];
    [self.output verify];
    
    [super tearDown];
}

- (void)testFindNewsDetails {
    NSString* title = @"test";
    NewsItem* news = [NewsItem new];
    [[[self.newsItemsDataStore stub] andReturn:news] findNewsItemByTitle: title];
    [[self.output expect] foundNewsDetails: news];
    [self.newsDetailsInteractor findNewsDetails: title];
}



@end