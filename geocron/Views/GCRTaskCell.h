//
//  GCRTaskCell.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/25.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRTaskCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *datetimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *daysLabel;
@property (nonatomic, weak) IBOutlet UILabel *urlLabel;
@end
