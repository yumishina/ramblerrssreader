//
//  NewsListInteractor.h
//  RamblerRSSReader
//
//  Created by Юлия on 26.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorIO.h"


@interface NewsListInteractor : NSObject <NewsListInteractorInput>

@property(nonatomic, weak) id <NewsListInteractorOutput> output;

@end
