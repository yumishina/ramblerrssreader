//
//  NewsListPresenterTests.m
//  RamblerRSSReader
//
//  Created by Юлия on 30.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "NewsListPresenter.h"
#import "NewsListWireframe.h"
#import "NewsItem.h"


@interface NewsListPresenterTests : XCTestCase
@property(nonatomic,strong) NewsListPresenter* newsListPresenter;
@property (nonatomic, strong) id userInterface;
@property (nonatomic, strong) id wireframe;
@end

@implementation NewsListPresenterTests

- (void)setUp {
    [super setUp];
    
    self.newsListPresenter = [NewsListPresenter new];
    
    self.userInterface = [OCMockObject mockForProtocol:@protocol(NewsListViewInterface)];
    self.newsListPresenter.userInterface = self.userInterface;
    
    self.wireframe = [OCMockObject mockForClass:[NewsListWireframe class]];
    self.newsListPresenter.wireframe = self.wireframe;
}

- (void)tearDown {
    [self.userInterface verify];
    [self.wireframe verify];
    
    [super tearDown];
}

- (void)testNewsListFound{
    [[self.userInterface expect] stopLoading];
    [[self.userInterface expect] showNewsData: OCMOCK_ANY];
    [self.newsListPresenter foundNewsItems:@[[NewsItem new]]];
}

- (void)testNewsListNotFound{
    [[self.userInterface expect] stopLoading];
    [[self.userInterface expect] showNoNewsMessage];
    [self.newsListPresenter foundNewsItems:@[]];
}

-(void)testNewsItemSelectedWithTitle{
    NSString* title = @"test";
    [[self.wireframe expect] presentNewsDetailsInterfaceWithTitle: title];
    [self.newsListPresenter newsItemSelectedWithTitle: title];
}

@end