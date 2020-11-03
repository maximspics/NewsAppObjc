//
//  SecondViewController.h
//  Lesson-3
//
//  Created by Maxim Safronov on 01.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "NewsDetailController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *content;
- (instancetype)initWithNews:(Article *)article;

@end

NS_ASSUME_NONNULL_END
