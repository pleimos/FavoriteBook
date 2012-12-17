//
//  RootListViewController.m
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import "RootListViewController.h"
#import "AppDelegate.h"
#import "Book.h"
#import "Favorite.h"
#import "RootListCell.h"

@interface RootListViewController ()

@end

@implementation RootListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(addBook:) name:@"addBook" object:nil];
    [self fetchResult];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [bookList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RootListCell *cell = (RootListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = (RootListCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    Book *book = [bookList objectAtIndex:indexPath.row];
    cell.bookTitle.text = book.title;
    UISwitch *swit = (UISwitch *)book.favorite;
    cell.favoriteSwitch.on = swit ? YES : NO;
    
    NSLog(@"cell indexPath.row: %d", indexPath.row );
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - CoreData
- (void)fetchResult
{
    
    
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    NSError *error;
    
    [request setEntity:entityDescription];
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    bookList = [[NSMutableArray alloc] initWithArray:results];
    
}

#pragma mark - 
- (void)addBook:(NSNotification *)noti
{
    NSDictionary *dic = [noti userInfo];
    NSManagedObjectContext *context = [[AppDelegate sharedDelegate] managedObjectContext];
    
    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    book.title = [dic valueForKey:@"title"];
    book.author = [dic valueForKey:@"author"];
    [bookList addObject:book];
    
    [self.tableView reloadData];
    
}


- (IBAction)toggleSwitch:(UISwitch *)cellSwitch
{
    RootListCell *cell = (RootListCell *)cellSwitch.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    //NSIndexPath *indexPath = [self.tableView indexPathForCell: (RootListCell *)[sender superview]];
    
    
    NSManagedObjectContext *context = [[AppDelegate sharedDelegate] managedObjectContext];
    NSError *error;
    
    Favorite *fav;
    Book *book = [bookList objectAtIndex:indexPath.row];
    
    if( cellSwitch.on ){
        fav = [NSEntityDescription insertNewObjectForEntityForName:@"Favorite" inManagedObjectContext:context];
        fav.date = [NSDate date];
        book.favorite = fav;
        
    } else {
        fav = (Favorite *)book.favorite;
        [context deleteObject:fav];
        
    }
    NSLog(@"toggleSwitch indexPath.row: %d", indexPath.row );
    
    [context save:&error];

}

@end
