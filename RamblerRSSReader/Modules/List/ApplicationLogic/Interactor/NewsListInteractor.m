//
//  NewsListInteractor.m
//  RamblerRSSReader
//
//  Created by Юлия on 26.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListInteractor.h"
#import "LentaNewsManager.h"
#import "GazetaNewsManager.h"
#import "NewsItemsDataStore.h"



@implementation NewsListInteractor{
    NSMutableArray* newsArray;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        newsArray = [NSMutableArray new];
    }
    return self;
}

-(void)findAllNews{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [[LentaNewsManager sharedInstance] loadNews:^(NSMutableArray* data, BOOL isSucceed) {
        if (isSucceed) {
            [newsArray addObjectsFromArray:data];
        }
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [[GazetaNewsManager sharedInstance] loadNews:^(NSMutableArray* data, BOOL isSucceed) {
        if (isSucceed) {
            [newsArray addObjectsFromArray:data];
        }
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        __weak typeof(self) weakSelf = self;
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"ts" ascending:NO];
        NSArray *sorted = [newsArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects: sort, nil]];
        [[NewsItemsDataStore sharedInstance] storeData:sorted];
        [weakSelf.output foundNewsItems:sorted];
    });
}

@end
