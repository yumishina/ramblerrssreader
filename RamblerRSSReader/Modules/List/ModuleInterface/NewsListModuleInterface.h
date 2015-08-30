//
//  NewsListModuleInterface.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsListModuleInterface_h
#define RamblerRSSReader_NewsListModuleInterface_h
#endif

#import <Foundation/Foundation.h>

@protocol NewsListModuleInterface <NSObject>
-(void)loadNewsList;
-(void)newsItemSelectedWithTitle:(NSString*)title;
@end