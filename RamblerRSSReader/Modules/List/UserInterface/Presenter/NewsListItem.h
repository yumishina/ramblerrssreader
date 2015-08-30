//
//  NewsListItem.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsListItem : NSObject

@property(nonatomic, strong) NSString* type;
@property(nonatomic, strong) NSString* imageUrl;
@property(nonatomic, strong) NSString* title;

@end
