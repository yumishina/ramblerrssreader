//
//  NewsListPresenter.h
//  RamblerRSSReader
//
//  Created by Юлия on 26.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsListInteractorIO.h"
#import "NewsListViewInterface.h"
#import "NewsListModuleInterface.h"
#import "NewsListWireframe.h"

@interface NewsListPresenter : NSObject <NewsListInteractorOutput, NewsListModuleInterface>

@property (nonatomic, strong) id <NewsListInteractorInput> newsListInteractor;
@property (nonatomic, strong) UIViewController <NewsListViewInterface> *userInterface;
@property (nonatomic, strong) NewsListWireframe* wireframe;

@end
