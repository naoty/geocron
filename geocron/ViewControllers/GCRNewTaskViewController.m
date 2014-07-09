//
//  GCRNewTaskViewController.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRNewTaskViewController.h"
#import "GCRTaskDaysViewController.h"
#import "GCRAppDelegate.h"
#import "GCRTask.h"

@interface GCRNewTaskViewController ()
@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) GCRTask *task;
@end

@implementation GCRNewTaskViewController

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
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    components.hour = 0;
    components.minute = 0;
    NSDate *beginningOfToday = [calendar dateFromComponents:components];
    self.timePicker.date = beginningOfToday;
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
    
    if (self.blockForSuccessfulSave) {
        self.blockForSuccessfulSave();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
