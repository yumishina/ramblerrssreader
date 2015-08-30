//
//  NewsDetailsViewController.m
//  RamblerRSSReader
//
//  Created by Юлия on 29.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsDetailsViewController.h"

@implementation NewsDetailsViewController

#pragma mark - LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.presenter loadNewsDetailsWithTitle:self.titleNews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - NewsDetailsViewInterface
-(void)setTitle:(NSString *)title{
    self.newsTitle.text = title;
}

-(void)setPicture:(NSString *)imageUrl{
    if (imageUrl) {
        self.newsImageHeightLayoutConstraint.constant = 280;
        NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        self.newsImage.image = [UIImage imageWithData:imageData];
    }else{
        self.newsImageHeightLayoutConstraint.constant = 0;
    }
}

-(void)setDescription:(NSString *)description{
    self.newsDescription.text = description;
}

@end
