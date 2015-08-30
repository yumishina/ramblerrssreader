//
//  NewsDetailsModuleInterface.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsDetailsModuleInterface_h
#define RamblerRSSReader_NewsDetailsModuleInterface_h
#endif

#import <Foundation/Foundation.h>

@protocol NewsDetailsModuleInterface <NSObject>

-(void)loadNewsDetailsWithTitle:(NSString*)title;

@end