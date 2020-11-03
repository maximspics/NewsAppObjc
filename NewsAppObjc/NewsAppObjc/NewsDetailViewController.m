//
//  NewsDetailViewController.m
//  Lesson-3
//
//  Created by Maxim Safronov on 10.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "News.h"

@interface NewsDetailViewController ()

@property (nonatomic) Article *article;

@end

@implementation NewsDetailViewController

- (instancetype)initWithNews:(Article *)article {
    self = [super init];
    _article = article;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = _article.title;
    self.contentLabel.text = _article.content;
    NSURL *imageUrl = [NSURL URLWithString:_article.urlToImage];
    NSLog(@"imageUrl: %@", imageUrl);
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: imageUrl]];
    if ([imageUrl  isEqual: @""]) {
        self.newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    } else {
      //  self.newsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 300)];
        self.newsImageView.image = image;
    }
    
    
    NSLog(@"_article.title: %@", _article.title);
    

}

@end
