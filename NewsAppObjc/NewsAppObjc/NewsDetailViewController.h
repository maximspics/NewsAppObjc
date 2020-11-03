//
//  NewsDetailViewController.h
//  Lesson-3
//
//  Created by Maxim Safronov on 10.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "NewsDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *newsImageView;
- (instancetype)initWithNews:(Article *)article;

@end

NS_ASSUME_NONNULL_END
