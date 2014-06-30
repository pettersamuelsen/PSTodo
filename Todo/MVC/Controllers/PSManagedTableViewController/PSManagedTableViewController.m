//
//  PSManagedTableViewController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSManagedTableViewController.h"

@implementation PSManagedTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

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

#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"defaultCellIdentifier";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  return cell;
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

#pragma mark - NSFetchedResultsControllerDelegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
  [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
  
  UITableView *tableView = self.tableView;
  
  switch(type) {
      
    case NSFetchedResultsChangeInsert:
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:[self tableViewRowAnimation]];
      break;
      
    case NSFetchedResultsChangeDelete:
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:[self tableViewRowAnimation]];
      break;
      
    case NSFetchedResultsChangeUpdate:
      [tableView reloadRowsAtIndexPaths:@[indexPath]
                       withRowAnimation:[self tableViewRowAnimation]];
      break;
      
    case NSFetchedResultsChangeMove:
      [tableView deleteRowsAtIndexPaths:[NSArray
                                         arrayWithObject:indexPath]
                       withRowAnimation:[self tableViewRowAnimation]];
      [tableView insertRowsAtIndexPaths:[NSArray
                                         arrayWithObject:newIndexPath]
                       withRowAnimation:[self tableViewRowAnimation]];
      break;
  }
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id )sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
  
  switch(type) {
      
    case NSFetchedResultsChangeInsert:
      [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                    withRowAnimation:[self tableViewRowAnimation]];
      break;
      
    case NSFetchedResultsChangeDelete:
      [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                    withRowAnimation:[self tableViewRowAnimation]];
      break;
  }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
  [self.tableView endUpdates];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
