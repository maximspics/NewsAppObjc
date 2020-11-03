//
//  NewsCell.m
//  Lesson-3
//
//  Created by Maxim Safronov on 08.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _titleLabel.text = @"";
    _authorLabel.text = @"";
    _descriptionLabel.text = @"";
}

@end
