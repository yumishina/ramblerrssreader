//
//  ViewController.m
//  RamblerRSSReader
//
//  Created by Юлия on 25.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsListPresenter.h"
#import "NewsListInteractor.h"
#import "NewsListCell.h"
#import "NewsListData.h"
#import "NewsListItem.h"


@interface NewsListViewController ()

@property (nonatomic, strong) NSArray* data;

@end

@implementation NewsListViewController


#pragma mark - LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsListCell" bundle:nil] forCellReuseIdentifier:@"NewsListCell"];
    self.tableView.allowsSelection = NO;
    self.navigationItem.title = @"Новости";
    [self.tableView setAllowsSelection:YES];
    self.indicatorView.hidden = NO;
    [self.activityIndicator startAnimating];
    [self.presenter loadNewsList];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - NewsListViewInterface
-(void)showNoNewsMessage{
    [[[UIAlertView alloc] initWithTitle:@"Не удалось загрузить новости"
                                message:@"По пробуйте позже"
                               delegate:self
                      cancelButtonTitle:@"OK"
                      otherButtonTitles: nil] show];
}

-(void)stopLoading{
    self.indicatorView.hidden = YES;
    [self.activityIndicator stopAnimating];
}

-(void)showNewsData:(NewsListData*)newsData{
    self.data = newsData.newsItems;
    [self.tableView reloadData];
}


#pragma mark - TableView
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 123;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (self.data.count) ? self.data.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsListCell" forIndexPath:indexPath];
    NewsListItem* news = [self.data objectAtIndex: indexPath.row];
    cell.typeNews.text = news.type;
    cell.titleNews.text = news.title;
    [cell setImageNewsWidthWithImageUrl: news.imageUrl];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsListCell* cell = (NewsListCell*)[tableView cellForRowAtIndexPath:indexPath];
    [self.presenter newsItemSelectedWithTitle: cell.titleNews.text];
}

@end
