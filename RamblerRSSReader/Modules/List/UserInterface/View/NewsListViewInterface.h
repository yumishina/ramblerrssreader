//
//  NewsListViewInterface.h
//  RamblerRSSReader
//
//  Created by Юлия on 27.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsListViewInterface_h
#define RamblerRSSReader_NewsListViewInterface_h
#endif

#import <Foundation/Foundation.h>

@class NewsListData;

@protocol NewsListViewInterface <NSObject>
-(void)showNoNewsMessage;
-(void)stopLoading;
-(void)showNewsData:(NewsListData*)newsData;
@end