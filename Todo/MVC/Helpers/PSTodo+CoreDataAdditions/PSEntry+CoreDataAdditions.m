//
//  PSEntry+CoreDataAdditions.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSEntry+CoreDataAdditions.h"

@implementation PSEntry (CoreDataAdditions)

#pragma mark - Class Methods
+ (PSEntry *)createInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([self class])
                                                       inManagedObjectContext:managedObjectContext];
  
  return (PSEntry *)[[NSManagedObject alloc] initWithEntity:entityDescription
                             insertIntoManagedObjectContext:managedObjectContext];
}

#pragma mark - Instance Methods
- (BOOL)save {
  return [[self managedObjectContext] save:nil];
}

- (void)toggleCompleted {
  self.completed = [NSNumber numberWithBool:!self.completed.boolValue];
  [self save];
}

@end
