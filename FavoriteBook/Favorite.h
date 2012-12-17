//
//  Favorite.h
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface Favorite : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Book *book;

@end
