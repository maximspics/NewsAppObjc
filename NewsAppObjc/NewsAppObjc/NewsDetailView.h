//
//  NewsDetailView.h
//  Lesson-3
//
//  Created by Maxim Safronov on 09.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailView : UIView

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UIImageView *image;
- (void)configureUI;

@end

NS_ASSUME_NONNULL_END
