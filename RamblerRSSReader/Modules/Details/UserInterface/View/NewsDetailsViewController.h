//
//  NewsDetailsViewController.h
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailsViewInterface.h"
#import "NewsDetailsPresenter.h"
#import "NewsDetailsModuleInterface.h"

@interface NewsDetailsViewController : UIViewController <NewsDetailsViewInterface>

@property (strong, nonatomic) IBOutlet UILabel *newsTitle;
@property (strong, nonatomic) IBOutlet UIImageView *newsImage;
@property (strong, nonatomic) IBOutlet UITextView *newsDescription;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *newsImageHeightLayoutConstraint;

@property (nonatomic, strong) id <NewsDetailsModuleInterface> presenter;
@property (nonatomic,strong) NSString* titleNews;

@end
