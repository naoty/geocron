//
//  GCRTaskDayViewController.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/28.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRTaskDaysViewController.h"
#import "GCRTask.h"

@interface GCRTaskDaysViewController ()
@property (nonatomic) NSUInteger selectedDays;
@end

@implementation GCRTaskDaysViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectedDays = GCRTaskDayNone;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.task.repeats = self.selectedDays;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (GCRTaskDay)dayAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return GCRTaskDaySunday;
            break;
        case 1:
            return GCRTaskDayMonday;
            break;
        case 2:
            return GCRTaskDayTuesday;
            break;
        case 3:
            return GCRTaskDayWednesday;
            break;
        case 4:
            return GCRTaskDayThursday;
            break;
        case 5:
            return GCRTaskDayFriday;
            break;
        case 6:
            return GCRTaskDaySaturday;
            break;
        default:
            return GCRTaskDayNone;
            break;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.selectedDays = self.selectedDays | [self dayAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    self.selectedDays = self.selectedDays ^ [self dayAtIndexPath:indexPath];
}

@end
