//
//  GCRTask.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/28.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef NS_OPTIONS(NSUInteger, GCRTaskDay) {
    GCRTaskDayNone = 0,
    GCRTaskDaySunday = 1 << 0,
    GCRTaskDayMonday = 1 << 1,
    GCRTaskDayTuesday = 1 << 2,
    GCRTaskDayWednesday = 1 << 3,
    GCRTaskDayThursday = 1 << 4,
    GCRTaskDayFriday = 1 << 5,
    GCRTaskDaySaturday = 1 << 6
};

@interface GCRTask : NSManagedObject

// Entity attributes
@property (nonatomic) NSTimeInterval time;
@property (nonatomic) int16_t repeats;
@property (nonatomic, retain) NSString * urlString;

- (NSString *)repeatsText;

@end
