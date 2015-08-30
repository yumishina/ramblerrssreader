//
//  LentaNewsManager.m
//  RamblerRSSReader
//
//  Created by Юлия on 25.08.15.
//  Copyright (c) 2015 yulia. All rights reserved.
//

#import "LentaNewsManager.h"
#import "NewsItem.h"

@implementation LentaNewsManager{
    NSMutableArray* newsArray;
    NSXMLParser* xmlParser;
    NewsItem* activeNews;
    NSMutableString* activeContent;
    BOOL is_Item;
    BOOL is_Title;
    BOOL is_Description;
    BOOL is_Date;
}


static id shared = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared = [(LentaNewsManager *) [super alloc] init];
    });
    return shared;
}


-(void)loadNews:(void(^)(NSMutableArray *data, BOOL isSucceed))completionBlock{
    NSURL *rssURL = [NSURL URLWithString:@"http://lenta.ru/rss"];
    NSURLRequest* request = [NSURLRequest requestWithURL:rssURL];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue new]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               if (connectionError){
                                   if(completionBlock){
                                       completionBlock(nil, NO);
                                   }
                               }else{
                                   xmlParser = [[NSXMLParser alloc] initWithData:data];
                                   xmlParser.delegate = self;
                                   
                                   [xmlParser parse];
                                   if(completionBlock) {
                                       completionBlock(newsArray, YES);
                                   }
                               }
                           }];
}



#pragma mark - NSXMLParserDelegate
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    newsArray = [NSMutableArray new];
    activeContent = [[NSMutableString alloc] init];
    is_Item = NO;
    is_Title = NO;
    is_Description = NO;
    is_Date = NO;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([[elementName lowercaseString] isEqualToString:@"item"]){
        activeNews = [NewsItem new];
        is_Item = YES;
    }
    if([[elementName lowercaseString] isEqualToString:@"title"]){
        is_Title = YES;
    }
    if ([[elementName lowercaseString] isEqualToString:@"description"]) {
        is_Description = YES;
    }
    if ([[elementName lowercaseString] isEqualToString:@"pubdate"]) {
        is_Date = YES;
    }
    if ([[elementName lowercaseString] isEqualToString:@"enclosure"]) {
        activeNews.newsImageUrl = [attributeDict objectForKey:@"url"];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (is_Item &&  (is_Title || is_Description || is_Date)) {
        if (![string isEqualToString:@"\n"]) {
            [activeContent appendString: string];
        }
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (is_Item) {
        if(is_Title){
            activeNews.newsTitle = activeContent;
            activeContent = [[NSMutableString alloc] init];
            is_Title = NO;
        }
        if (is_Description) {
            activeNews.newsDescription = activeContent;
            activeContent = [[NSMutableString alloc] init];
            is_Description = NO;
        }
        if (is_Date) {
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
            activeNews.ts = [NSNumber numberWithDouble:[[dateFormatter dateFromString: activeContent] timeIntervalSince1970]];
            activeContent = [[NSMutableString alloc] init];
            is_Date = NO;
        }
        activeNews.newsType = @"Lenta.ru";
        if([[elementName lowercaseString] isEqualToString:@"item"]){
            [newsArray addObject: activeNews];
            is_Item = NO;
        }
    }
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@", [parseError localizedDescription]);
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
}


@end
