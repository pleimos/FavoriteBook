//
//  WriteViewController.h
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteViewController : UIViewController {
    IBOutlet UITextField *bookTitle;
    IBOutlet UITextField *bookAuthor;
}

- (IBAction)btnCancel:(id)sender;
- (IBAction)btnDone:(id)sender;

@end
