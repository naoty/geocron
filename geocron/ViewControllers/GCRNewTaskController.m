//
//  GCRNewTaskController.m
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import "GCRNewTaskController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction

- (IBAction)didTappedCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
