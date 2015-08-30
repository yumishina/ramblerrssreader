//
//  NewsListCell.m
//  RamblerRSSReader
//
//  Created by Юлия on 27.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "NewsListCell.h"

@implementation NewsListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setImageNewsWidthWithImageUrl:(NSString*)imageUrl{
    if (imageUrl) {
        self.imageNews.image = [self convertStringToImage: imageUrl];
        self.imageWidthLayoutConstant.constant = 70;
    }else{
        self.imageWidthLayoutConstant.constant = 0;
    }
}

-(UIImage*)convertStringToImage:(NSString*)url{
    NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return [UIImage imageWithData:imageData];
}

@end
