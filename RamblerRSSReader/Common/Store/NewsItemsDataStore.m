//
//  NewsItemsDataStore.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsItemsDataStore.h"

@implementation NewsItemsDataStore

static id shared = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared = [(NewsItemsDataStore *) [super alloc] init];
    });
    return shared;
}

-(void)storeData:(NSArray*) newsItems{
    self.tmpStore = [NSMutableDictionary new];
    [self.tmpStore setObject:newsItems forKey:@"store"];
}

-(NewsItem*)findNewsItemByTitle:(NSString*)title{
    NSArray* newsItems = [self.tmpStore objectForKey:@"store"];
    for (NewsItem* news in newsItems) {
        if ([news.newsTitle isEqualToString:title]) {
            return news;
        }
    }
    return nil;
}

@end
