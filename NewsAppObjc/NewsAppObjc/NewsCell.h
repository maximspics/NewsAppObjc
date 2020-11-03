//
//  NewsCell.h
//  Lesson-3
//
//  Created by Maxim Safronov on 08.06.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

NS_ASSUME_NONNULL_END
