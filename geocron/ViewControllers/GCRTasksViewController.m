//
//  GCRTasksViewController.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/24.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "GCRTasksViewController.h"
#import "GCRAppDelegate.h"
#import "GCRNewTaskController.h"
#import "GCRTaskCell.h"
#import "GCRTask.h"

@interface GCRTasksViewController ()
@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation GCRTasksViewController

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
    
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateFormat = @"HH:mm";
    
    GCRAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext];
    request.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"time" ascending:YES]];
    request.fetchBatchSize = 10;
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                    managedObjectContext:managedObjectContext
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Failed to fetch: %@", error);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewTaskSegue"]) {
        UINavigationController *nagivationController = segue.destinationViewController;
        GCRNewTaskController *newTaskController = nagivationController.viewControllers.firstObject;
        __weak GCRTasksViewController *weakSelf = self;
        newTaskController.blockForSuccessfulSave = ^{
            [weakSelf reloadTasks];
        };
    }
}

#pragma mark - Private methods

- (void)configureCell:(GCRTaskCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    GCRTask *task = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.timeLabel.text = [self.dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:task.time]];
    cell.repeatsLabel.text = [task repeatsText];
    cell.urlLabel.text = task.urlString;
}

- (void)reloadTasks
{
    NSError *error = nil;
    if ([self.fetchedResultsController performFetch:&error]) {
        [self.tableView reloadData];
    } else {
        NSLog(@"Failed to fetch: %@", error);
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GCRTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

@end
