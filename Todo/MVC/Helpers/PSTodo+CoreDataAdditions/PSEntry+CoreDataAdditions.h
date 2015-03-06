//
//  PSEntry+CoreDataAdditions.h
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSEntry.h"

@interface PSEntry (CoreDataAdditions)

/**
 *  Creates an PSEntry object in the given managed object context
 *
 *  @return Returns the newly created PSEntry object
 */
+ (PSEntry *)createWithTitle:(NSString *)title;

/**
 *  Toggles the current state of the PSEntry's 'completed' value
 */
- (BOOL)toggleCompleted;

@end
