//
//  NSDate+GCRWeekday.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/07/09.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GCRWeekday)

- (instancetype)nextWeekday:(NSUInteger)weekday;

@end
