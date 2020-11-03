//
//  NewsDetailView.m
//  Lesson-3
//
//  Created by Maxim Safronov on 09.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import "NewsDetailView.h"

@implementation NewsDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI {
    self.backgroundColor = [UIColor whiteColor];
    
    // Создаем лейбл для названия новости
    self.title = [[UILabel alloc] init];
    self.title.translatesAutoresizingMaskIntoConstraints = false;
    self.title.font = [UIFont systemFontOfSize:17];
    self.title.numberOfLines = 3;
    self.title.textColor = [UIColor blackColor];
    [self addSubview:self.title];
    
    // Создаем блок для текста новости
    self.content = [[UILabel alloc] init];
    self.content.translatesAutoresizingMaskIntoConstraints = false;
    self.content.font = [UIFont systemFontOfSize:12];
    self.content.textColor = [UIColor blackColor];
    self.content.numberOfLines = 50;
    self.content.textAlignment = NSTextAlignmentJustified;
    [self addSubview:self.content];
    
    // Создаем блок под фотографию для новости
    self.image = [[UIImageView alloc] init];
    self.image.translatesAutoresizingMaskIntoConstraints = false;
    self.image.contentMode = UIViewContentModeScaleAspectFill;
    self.image.clipsToBounds = true;
    self.image.layer.cornerRadius = 10;
    [self addSubview:self.image];
}


@end
