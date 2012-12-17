//
//  RootListViewController.h
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootListViewController : UITableViewController {
    NSMutableArray *bookList;
    NSMutableArray *favoriteList;
}

- (IBAction)toggleSwitch:(UISwitch *)sender;

- (void)addBook:(NSNotification *)noti;
- (void)changeFavoriteValue:(id)sender;

@end
