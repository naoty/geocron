//
//  GCRTaskCell.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/25.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRTaskCell.h"

@interface GCRTaskCell ()
@end

@implementation GCRTaskCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
