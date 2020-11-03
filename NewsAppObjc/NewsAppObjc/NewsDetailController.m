//
//  SecondViewController.m
//  Lesson-3
//
//  Created by Maxim Safronov on 01.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import "NewsDetailController.h"
#import "NewsListController.h"
#import "News.h"

@interface NewsDetailController ()

//@property (strong, nonatomic) NSMutableArray<Article *> *articles;
@property (nonatomic) Article *article;

@end

@implementation NewsDetailController

- (instancetype)initWithNews:(Article *)article {
    self = [super init];
    _article = article;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _article.title;
    self.titleLabel.text = _article.title;
    self.content.text = _article.content;
    NSURL *imageUrl = [NSURL URLWithString:_article.urlToImage];
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: imageUrl]];
    self.image.image = image;
    
    NSLog(@"_article.title: %@", _article.title);
    

}

@end
