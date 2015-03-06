//
//  PSEntry+CoreDataAdditions.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSEntry+CoreDataAdditions.h"
#import "PSCoreDataManager.h"

@implementation PSEntry (CoreDataAdditions)

#pragma mark - Class Methods
+ (PSEntry *)createWithTitle:(NSString *)title {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([self class])
                                                         inManagedObjectContext:[self managedObjectContext]];
    
    PSEntry *entry = [[[self class] alloc] initWithEntity:entityDescription
                           insertIntoManagedObjectContext:[self managedObjectContext]];
    entry.title = title;
    entry.createdAt = [NSDate date];
    entry.completed = @(NO);
    [entry save];
    
    return entry;
}

#pragma mark - Instance Methods
- (BOOL)save {
    return [[self managedObjectContext] save:nil];
}

- (BOOL)toggleCompleted {
    self.completed = [NSNumber numberWithBool:!self.completed.boolValue];
    return [self save];
}

#pragma mark - Private Methods
#pragma mark - Helpers
+ (NSManagedObjectContext *)managedObjectContext {
    return [PSCoreDataManager sharedManager].managedObjectContext;
}

@end
