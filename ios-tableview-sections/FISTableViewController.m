//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISStudent.h"

@interface FISTableViewController ()

@end

@implementation FISTableViewController

// Make some FISStudents and give them all names. Then fill in their favoriteThings properties with strings of their favorite things.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    FISStudent *student1 = [[FISStudent alloc] initWithName:@"Ismael" favoriteThings:@[@"Reading", @"Youtube", @"Design"]];
    FISStudent *student2 = [[FISStudent alloc] initWithName:@"Eldon" favoriteThings:@[@"Music", @"Basketball", @"Shoes"]];
    FISStudent *student3 = [[FISStudent alloc] initWithName:@"David" favoriteThings:@[@"Lord of the Rings", @"Side-projects", @"Cats"]];
    FISStudent *student4 = [[FISStudent alloc] initWithName:@"Bettina" favoriteThings:@[@"Harry Potter", @"Food", @"iOS"]];
    FISStudent *student5 = [[FISStudent alloc] initWithName:@"Rebecca" favoriteThings:@[@"Game of Thrones", @"Medevil History"]];

    self.students = @[student1, student2, student3, student4, student5];
}

#pragma mark - Table view data source

// Each student should have their own section:
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return (NSInteger)[self.students count];
    
}

// Change the headers such that it is the student's name property:
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    FISStudent *studentName = self.students[section];
    
    return studentName.name;

}

// The rows in each section match that student's favoriteThings:
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    FISStudent *currentStudent = self.students[section];
    
    return (NSInteger)[currentStudent.favoriteThings count];

}

// Set your cell's textLabel to a favorite thing, and its detailTextLabel to its row index:
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    
    FISStudent *currentStudent = self.students[indexPath.section];
    
    cell.textLabel.text = [currentStudent.favoriteThings objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li" , indexPath.row + 1];

    return cell;
}

// Provide an indentation level:
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 2;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
