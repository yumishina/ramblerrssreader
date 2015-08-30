//
//  NewsListWireframe.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailsWireframe.h"

@class NewsListPresenter;
@class RootWireframe;

@interface NewsListWireframe : NSObject

@property(nonatomic, strong) RootWireframe* rootWireframe;
@property(nonatomic, strong) NewsListPresenter* newsListPresenter;
@property(nonatomic, strong) NewsDetailsWireframe* newsDetailsWireframe;

-(void)presentListInterfaceFromWindow:(UIWindow *)window;
-(void)presentNewsDetailsInterfaceWithTitle:(NSString*)title;

@end
