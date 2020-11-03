//
//  News.h
//  Lesson-3
//
//  Created by Maxim Safronov on 07.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class News;
@class Article;
@class Source;

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject
@property (nonatomic, nullable, copy)   NSString *status;
@property (nonatomic, nullable, strong) NSNumber *totalResults;
@property (nonatomic, nullable, copy)   NSArray<Article *> *articles;
@end

@interface Article : NSObject
@property (nonatomic, nullable, strong) Source *source;
@property (nonatomic, nullable, copy)   NSString *author;
@property (nonatomic, nullable, copy)   NSString *title;
@property (nonatomic, nullable, copy)   NSString *theDescription;
@property (nonatomic, nullable, copy)   NSString *url;
@property (nonatomic, nullable, copy)   NSString *urlToImage;
@property (nonatomic, nullable, copy)   NSString *publishedAt;
@property (nonatomic, nullable, copy)   NSString *content;
@end

@interface Source : NSObject
@property (nonatomic, nullable, copy) NSString *identifier;
@property (nonatomic, nullable, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
