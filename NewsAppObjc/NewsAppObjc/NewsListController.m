//
//  ViewController.m
//  Lesson-3
//
//  Created by Maxim Safronov on 31.05.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import "NewsListController.h"
#import "NewsDetailController.h"
#import "NewsDetailViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsListController ()

@property (strong, nonatomic) NSMutableArray<Article *> *articles;

@end

@implementation NewsListController

NSString *cellId = @"NewsCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Apple news";
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self fetchingNews];
    
}

-(void)fetchingNews {
    NSString *urlString = @"http://newsapi.org/v2/everything?q=apple&from=2020-11-02&to=2020-11-02&sortBy=popularity&apiKey=0f24414a137f43ee871413b89ae2a13e";
    NSURL *url = [NSURL URLWithString: urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Finished fetching news");
        NSString *jsonData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"\nJSON STRING DATA: \n%@", jsonData);
        
        NSError *err;
        NSDictionary *newsJSONDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSDictionary *dic = [newsJSONDict objectForKey:@"articles"];
        NSMutableArray<Article *> *articles = NSMutableArray.new;
        
        for (NSDictionary *newsDict in dic) {
            Article *article = Article.new;
            if ([newsDict valueForKey:@"title"] != (id)[NSNull null]) {
                article.title = [newsDict valueForKey:@"title"];
            } else {
                  article.title = @"";
            };
            if ([newsDict valueForKey:@"content"] != (id)[NSNull null]) {
                article.content = [newsDict valueForKey:@"content"];
            } else {
                  article.content = @"";
            };
            if ([newsDict valueForKey:@"author"] != (id)[NSNull null]) {
                article.author = [newsDict valueForKey:@"author"];
            } else {
                  article.author = @"";
            };
            if ([newsDict valueForKey:@"urlToImage"] != (id)[NSNull null]) {
                article.urlToImage = [newsDict valueForKey:@"urlToImage"];
            } else {
                  article.urlToImage = @"";
            };
            
            [articles addObject:article];
            
        }
        
        self.articles = articles;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }] resume];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:cellId bundle:nil] forCellReuseIdentifier:cellId];
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    }
    
    Article *article = self.articles[indexPath.row];
    
    NSURL *imageUrl = [NSURL URLWithString:article.urlToImage];
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL: imageUrl]];
    UIImage *imageCompressed = [self compressImage:image];
    
    cell.titleLabel.text = article.title;
    cell.authorLabel.text = [NSString stringWithFormat:@"Author: %@", article.author];
    if ([article.author  isEqual: @""]) {
        [cell.authorLabel setHidden:YES];
    }
    cell.descriptionLabel.text = article.content;
    [cell.image setImage: image];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor grayColor];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    } else {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Article *articles = [_articles objectAtIndex:indexPath.row];
    UIViewController *newsDetail = (NewsDetailViewController *)[[NewsDetailViewController alloc] initWithNews:articles];
    newsDetail.view.backgroundColor = [UIColor whiteColor];
    // Покажем страницу
    [self.navigationController pushViewController:newsDetail animated:YES];
    
    // Снимаем выделение текущей строчки
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIImage *)compressImage:(UIImage *)image{

    NSData *imgData = UIImageJPEGRepresentation(image, 1);
    NSLog(@"Size of Image(bytes):%ld",(unsigned long)[imgData length]);

    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float maxHeight = 100.0;
    float maxWidth = 100.0;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.5;

    if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        }
        else{
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }

    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();

    NSLog(@"Size of Image(bytes):%ld",(unsigned long)[imageData length]);

    return [UIImage imageWithData:imageData];
}

@end
