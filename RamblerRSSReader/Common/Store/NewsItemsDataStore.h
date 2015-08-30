//
//  NewsItemsDataStore.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsItem.h"

@interface NewsItemsDataStore : NSObject

@property(nonatomic, strong) NSMutableDictionary* tmpStore;

+ (instancetype)sharedInstance;
-(void)storeData:(NSArray*) newsItems;
-(NewsItem*)findNewsItemByTitle:(NSString*)title;

@end
