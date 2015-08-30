//
//  NewsListDataCollector.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListData.h"

@interface NewsListDataCollector : NSObject

-(NewsListData*)convertNewsList:(NSArray*)newsItems;

@end
