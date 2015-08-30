//
//  NewsDetailsInteractor.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailsInteractorIO.h"

@interface NewsDetailsInteractor : NSObject <NewsDetailsInteractorInput>

@property(nonatomic, weak) id <NewsDetailsInteractorOutput> output;

@end
