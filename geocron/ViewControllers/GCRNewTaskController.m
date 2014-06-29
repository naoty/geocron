//
//  GCRNewTaskController.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRNewTaskController.h"
#import "GCRTaskDaysViewController.h"
#import "GCRAppDelegate.h"
#import "GCRTask.h"

@interface GCRNewTaskController ()
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) GCRTask *task;
@end

@implementation GCRNewTaskController

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
    
    GCRAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    self.task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:self.managedObjectContext];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.repeatsTextLabel.text = [self.task repeatsText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GCRTaskDaysViewController *repeatsViewController = segue.destinationViewController;
    repeatsViewController.task = self.task;
}

#pragma mark - IBAction

- (IBAction)didTappedCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTappedSaveButton:(id)sender
{
    self.task.time = [self.timePicker.date timeIntervalSince1970];
    self.task.urlString = self.urlStringField.text;
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Failed to save: %@", error);
    };
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
