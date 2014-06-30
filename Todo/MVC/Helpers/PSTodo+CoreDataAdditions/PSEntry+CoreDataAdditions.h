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
 *  @param managedObjectContext The object managed context to be used when creating the PSEntry. Must not be nil.
 *
 *  @return Returns the newly created PSEntry in the given managed object context
 */
+ (PSEntry *)createInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 *  Saves the PSEntry in it's respective managed object context
 *
 *  @return Returns a BOOL wether the save was successful or not
 */
- (BOOL)save;

/**
 *  Toggles the current state of the PSEntry's 'completed' value
 */
- (void)toggleCompleted;

@end
