//
//  NewsListInteractorIO.h
//  RamblerRSSReader
//
//  Created by Юлия on 26.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsListInteractorIO_h
#define RamblerRSSReader_NewsListInteractorIO_h
#endif


#import <Foundation/Foundation.h>


@protocol NewsListInteractorInput <NSObject>
-(void)findAllNews;
@end


@protocol NewsListInteractorOutput <NSObject>
-(void)foundNewsItems:(NSArray*)foundItems;
@end
