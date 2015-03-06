//
//  PSManagedTableViewController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSManagedTableViewController.h"

@implementation PSManagedTableViewController

#pragma mark - Getters
- (NSString *)entityName {
  return nil;
}

- (NSPredicate *)predicate {
  return nil;
}

- (NSArray *)sortDescriptors {
  return nil;
}

- (NSString *)sectionNameKeyPath {
  return nil;
}

- (UITableViewRowAnimation)tableViewRowAnimation {
  return UITableViewRowAnimationFade;
}

- (NSManagedObjectContext *)managedObjectContext {
  return nil;
}

#pragma mark - NSFetchedResultsControllerDelegate
- (NSFetchedResultsController *)fetchedResultsController {
  if (_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
  fetchRequest.predicate = [self predicate];
  fetchRequest.sortDescriptors = [self sortDescriptors];
  
  _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                  managedObjectContext:[self managedObjectContext]
                                                                    sectionNameKeyPath:[self sectionNameKeyPath]
                                                                             cacheName:nil];
  _fetchedResultsController.delegate = self;
  [_fetchedResultsController performFetch:nil];
  
  return _fetchedResultsController;
}

@end
