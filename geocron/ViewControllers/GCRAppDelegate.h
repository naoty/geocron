//
//  GCRAppDelegate.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/24.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@end
