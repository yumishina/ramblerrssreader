//
//  ViewController.h
//  RamblerRSSReader
//
//  Created by Юлия on 25.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListViewInterface.h"
#import "NewsListPresenter.h"
#import "NewsListModuleInterface.h"

@interface NewsListViewController : UIViewController <NewsListViewInterface, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *indicatorView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) id <NewsListModuleInterface> presenter;

@end

