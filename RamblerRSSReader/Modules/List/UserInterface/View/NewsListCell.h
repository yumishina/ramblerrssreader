//
//  NewsListCell.h
//  RamblerRSSReader
//
//  Created by Юлия on 27.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *typeNews;
@property (strong, nonatomic) IBOutlet UIImageView *imageNews;
@property (strong, nonatomic) IBOutlet UILabel *titleNews;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthLayoutConstant;

-(void)setImageNewsWidthWithImageUrl:(NSString*)imageUrl;

@end
