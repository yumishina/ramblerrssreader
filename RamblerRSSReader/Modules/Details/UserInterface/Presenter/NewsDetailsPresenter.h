//
//  NewsDetailsPresenter.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsDetailsInteractorIO.h"
#import "NewsDetailsViewInterface.h"
#import "NewsDetailsModuleInterface.h"

@interface NewsDetailsPresenter : NSObject <NewsDetailsInteractorOutput, NewsDetailsModuleInterface>

@property (nonatomic, strong) id <NewsDetailsInteractorInput> detailsInteractor;
@property (nonatomic, strong) UIViewController <NewsDetailsViewInterface> *userInterface;

@end
