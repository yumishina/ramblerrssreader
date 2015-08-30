//
//  LentaNewsManager.h
//  RamblerRSSReader
//
//  Created by Юлия on 25.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LentaNewsManager : NSObject <NSXMLParserDelegate>

+ (instancetype)sharedInstance;
-(void)loadNews:(void(^)(NSMutableArray *data, BOOL isSucceed))completionBlock;

@end
