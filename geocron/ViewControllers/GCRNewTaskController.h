//
//  GCRNewTaskController.h
//  geocron
//
//  Created by Naoto Kaneko on 2014/06/27.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCRNewTaskController : UITableViewController

@property (nonatomic, weak) IBOutlet UIDatePicker *timePicker;
@property (nonatomic, weak) IBOutlet UILabel *repeatsTextLabel;
@property (nonatomic, weak) IBOutlet UITextField *urlStringField;

@property (nonatomic, copy) void (^blockForSuccessfulSave)();

- (IBAction)didTappedCancelButton:(id)sender;
- (IBAction)didTappedSaveButton:(id)sender;

@end
