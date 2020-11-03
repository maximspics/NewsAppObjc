//
//  ViewController.h
//  Lesson-3
//
//  Created by Maxim Safronov on 31.05.2020.
//  Copyright © 2020 Maxim Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonnull) UITableView *tableView;

@end

