//
//  NewsListInteractorTests.m
//  RamblerRSSReader
//
//  Created by Юлия on 30.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Foundation/Foundation.h>
#import "NewsListInteractor.h"
#import "LentaNewsManager.h"
#import "GazetaNewsManager.h"
#import "NewsItemsDataStore.h"
#import "NewsListInteractorIO.h"
#import "NewsItem.h"

@interface NewsListInteractorTests : XCTestCase

@property(nonatomic, strong) NewsListInteractor* newsListInteractor;
@property(nonatomic, strong) id lentaNewsManager;
@property(nonatomic, strong) id gazetaNewsManager;
@property(nonatomic, strong) id newsItemsDataStore;
@property(nonatomic, strong) id output;

@property (nonatomic) dispatch_group_t group;


@end

@implementation NewsListInteractorTests

- (void)setUp {
    [super setUp];
    self.group = dispatch_group_create();
    
    self.newsListInteractor = [NewsListInteractor new];
    
    self.lentaNewsManager = [OCMockObject niceMockForClass:[LentaNewsManager class]];
    [[[self.lentaNewsManager stub] andReturn:self.lentaNewsManager] sharedInstance];
    
    self.gazetaNewsManager = [OCMockObject niceMockForClass:[GazetaNewsManager class]];
    [[[self.gazetaNewsManager stub] andReturn:self.gazetaNewsManager] sharedInstance];
    
    self.newsItemsDataStore = [OCMockObject niceMockForClass:[NewsItemsDataStore class]];
    [[[self.newsItemsDataStore stub] andReturn:self.newsItemsDataStore] sharedInstance];
    
    self.output = [OCMockObject mockForProtocol:@protocol(NewsListInteractorOutput)];
    self.newsListInteractor.output = self.output;
}

- (void)tearDown {
    [self waitForGroup];
    [self.lentaNewsManager verify];
    [self.gazetaNewsManager verify];
    [self.newsItemsDataStore verify];
    [self.output verify];
    
    [super tearDown];
}

- (void)waitForGroup;
{
    __block BOOL didComplete = NO;
    dispatch_group_notify(self.group, dispatch_get_main_queue(), ^{
        didComplete = YES;
    });
    while (! didComplete) {
        NSTimeInterval const interval = 0.002;
        if (! [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:interval]]) {
            [NSThread sleepForTimeInterval:interval];
        }
    }
}

- (void)testFindNewsItemsFromManagers {
    NewsItem* lentaItem = [self createNewsItemWithTitle:@"Lenta" andTimestamp:@2];
    NSArray* lentaArray = @[lentaItem];
    NewsItem* gazetaItem = [self createNewsItemWithTitle:@"Gazeta" andTimestamp:@1];
    NSArray* gazetaArray = @[gazetaItem];
    NSArray* resultArray = @[lentaItem, gazetaItem];
    
    [self lentaNewsManagerWillReturnNews:lentaArray];
    [self gazetaNewsManagerWillReturnNews:gazetaArray];
    
    [[self.newsItemsDataStore expect] storeData: resultArray];
    [[self.output expect] foundNewsItems:resultArray];
    [self.newsListInteractor findAllNews];
    
}

- (void)lentaNewsManagerWillReturnNews: (NSArray*) newsItems {
    dispatch_group_enter(self.group);
    [[[self.lentaNewsManager stub] andDo:^(NSInvocation *invocation) {
        void (^callback)(NSMutableArray* data, BOOL isSucceed) = NULL;
        [invocation getArgument:&callback atIndex:2];
        callback([newsItems mutableCopy], YES);
        dispatch_group_leave(self.group);
    }] loadNews: OCMOCK_ANY];
}

- (void)gazetaNewsManagerWillReturnNews: (NSArray*) newsItems {
    dispatch_group_enter(self.group);
    [[[self.gazetaNewsManager stub] andDo:^(NSInvocation *invocation) {
        void (^callback)(NSMutableArray* data, BOOL isSucceed) = NULL;
        [invocation getArgument:&callback atIndex:2];
        callback([newsItems mutableCopy], YES);
        dispatch_group_leave(self.group);
    }] loadNews: OCMOCK_ANY];
}

- (NewsItem*) createNewsItemWithTitle: (NSString*) title andTimestamp: (NSNumber*) ts {
    NewsItem* newsItem = [NewsItem new];
    newsItem.newsTitle = title;
    newsItem.ts = ts;
    return newsItem;
}


@end