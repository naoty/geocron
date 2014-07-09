//
//  NSDate+GCRWeekday.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/07/09.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "NSDate+GCRWeekday.h"

@implementation NSDate (GCRWeekday)

- (instancetype)nextWeekday:(NSUInteger)weekday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
                                               fromDate:self];
    
    NSInteger intervalDays = components.weekday - weekday;
    components.day += intervalDays;
    components.weekday = weekday;
    NSDate *nextDate = [calendar dateFromComponents:components];
    
    if ([[NSDate date] compare:nextDate] == NSOrderedDescending) {
        components.day += 7;
        nextDate = [calendar dateFromComponents:components];
    }
    
    return nextDate;
}

@end
