//
//  NewsDetailsInteractorIO.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsDetailsInteractorIO_h
#define RamblerRSSReader_NewsDetailsInteractorIO_h
#endif

#import <Foundation/Foundation.h>

@class NewsItem;


@protocol NewsDetailsInteractorInput <NSObject>
-(void)findNewsDetails:(NSString*)title;
@end


@protocol NewsDetailsInteractorOutput <NSObject>
-(void)foundNewsDetails:(NewsItem*)newsItem;
@end;