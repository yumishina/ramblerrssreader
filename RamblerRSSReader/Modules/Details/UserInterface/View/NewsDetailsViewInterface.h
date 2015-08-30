//
//  NewsDetailsViewInterface.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#ifndef RamblerRSSReader_NewsDetailsViewInterface_h
#define RamblerRSSReader_NewsDetailsViewInterface_h
#endif

#import <Foundation/Foundation.h>

@protocol NewsDetailsViewInterface <NSObject>
-(void)setTitle:(NSString*)title;
-(void)setPicture:(NSString*)imageUrl;
-(void)setDescription:(NSString*)description;
@end
