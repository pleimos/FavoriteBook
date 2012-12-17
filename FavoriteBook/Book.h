//
//  Book.h
//  FavoriteBook
//
//  Created by jinwoo choi on 12. 12. 17..
//  Copyright (c) 2012년 pleimos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSManagedObject *favorite;

@end
