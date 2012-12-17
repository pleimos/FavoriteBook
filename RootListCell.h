//
//  RootListCell.h
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 18..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootListCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UISwitch *favoriteSwitch;
@property (retain, nonatomic) IBOutlet UILabel *bookTitle;

@end
