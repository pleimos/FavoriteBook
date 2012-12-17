//
//  WriteViewController.m
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import "WriteViewController.h"
#import "AppDelegate.h"
#import "Favorite.h"
#import "Book.h"

@interface WriteViewController ()

@end

@implementation WriteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btnDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    
    Book *row = nil;
    row = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:context];
    row.title = [bookTitle text];
    row.author = [bookAuthor text];
    [context save:&error];
    
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:row.title, @"title", row.author, @"author", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addBook" object:nil userInfo:dic];
    
}

@end
