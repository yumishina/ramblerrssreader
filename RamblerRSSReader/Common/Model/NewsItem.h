//
//  News.h
//  RamblerRSSReader
//
//  Created by Юлия on 25.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsItem : NSObject

@property(nonatomic, strong) NSString* newsTitle;
@property(nonatomic, strong) NSString* newsDescription;
@property(nonatomic, strong) NSString* newsImageUrl;
@property(nonatomic, strong) NSString* newsType;
@property(nonatomic, strong) NSNumber* ts;

@end
