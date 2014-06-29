//
//  GCRTask.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/28.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRTask.h"

@implementation GCRTask

@dynamic time;
@dynamic repeats;
@dynamic urlString;

- (NSString *)repeatsText
{
    if ([self hasScheduleOnDay:[GCRTask GCRTaskDayEveryday]]) {
        return NSLocalizedString(@"GCRTaskDayEveryday", nil);
    }
    
    NSMutableArray *repeatsTexts = [NSMutableArray new];
    
    if ([self hasScheduleOnDay:[GCRTask GCRTaskDayWeekday]]) {
        [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayWeekday", nil)];
        if ([self hasScheduleOnDay:GCRTaskDaySunday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDaySunday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDaySaturday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDaySaturday", nil)];
        }
    } else if ([self hasScheduleOnDay:[GCRTask GCRTaskDayWeekend]]) {
        [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayWeekend", nil)];
        if ([self hasScheduleOnDay:GCRTaskDayMonday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayMonday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayTuesday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayTuesday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayWednesday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayWednesday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayThursday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayThursday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayFriday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayFriday", nil)];
        }
    } else {
        if ([self hasScheduleOnDay:GCRTaskDaySunday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDaySunday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayMonday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayMonday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayTuesday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayTuesday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayWednesday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayWednesday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayThursday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayThursday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDayFriday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayFriday", nil)];
        }
        if ([self hasScheduleOnDay:GCRTaskDaySaturday]) {
            [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDaySaturday", nil)];
        }
    }
    
    if (repeatsTexts.count == 0) {
        [repeatsTexts addObject:NSLocalizedString(@"GCRTaskDayNone", nil)];
    }
    
    return [repeatsTexts componentsJoinedByString:@", "];
}

#pragma mark - Private methods

- (BOOL)hasScheduleOnDay:(GCRTaskDay)day
{
    return (self.repeats & day) == day;
}

+ (GCRTaskDay)GCRTaskDayEveryday
{
    return GCRTaskDaySunday|GCRTaskDayMonday|GCRTaskDayTuesday|GCRTaskDayWednesday|GCRTaskDayThursday|GCRTaskDayFriday|GCRTaskDaySaturday;
}

+ (GCRTaskDay)GCRTaskDayWeekday
{
    return GCRTaskDayMonday|GCRTaskDayTuesday|GCRTaskDayWednesday|GCRTaskDayThursday|GCRTaskDayFriday;
}

+ (GCRTaskDay)GCRTaskDayWeekend
{
    return GCRTaskDaySunday|GCRTaskDaySaturday;
}

@end
