//
//  NewsListDataCollector.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListDataCollector.h"
#import "NewsItem.h"
#import "NewsListItem.h"

@implementation NewsListDataCollector

-(NewsListData*)convertNewsList:(NSArray*)newsItems{
    NewsListData* newsListData = [NewsListData new];
    NSMutableArray* newsListItems = [NSMutableArray new];
    
    for (int i = 0; i < newsItems.count; i++) {
        NewsItem* newsItem = [newsItems objectAtIndex:i];
        NewsListItem* newsListItem = [NewsListItem new];
        newsListItem.type = newsItem.newsType;
        newsListItem.title = newsItem.newsTitle;
        newsListItem.imageUrl = newsItem.newsImageUrl;
        [newsListItems addObject:newsListItem];
    }
    newsListData.newsItems = newsListItems;
    return newsListData;
}

@end
