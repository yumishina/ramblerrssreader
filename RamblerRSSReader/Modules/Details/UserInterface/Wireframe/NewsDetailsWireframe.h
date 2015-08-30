//
//  NewsDetailsWireframe.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootWireframe.h"
#import "NewsDetailsPresenter.h"

@interface NewsDetailsWireframe : NSObject

@property(nonatomic, strong) RootWireframe* rootWireframe;
@property(nonatomic, strong) NewsDetailsPresenter* newsDetailsPresenter;

-(void)presentDetailsInterfaceWithTitle:(NSString*)title;

@end
