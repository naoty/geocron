//
//  GCRTaskCell.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/25.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRTaskCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *repeatsLabel;
@property (nonatomic, weak) IBOutlet UILabel *urlLabel;
@end
