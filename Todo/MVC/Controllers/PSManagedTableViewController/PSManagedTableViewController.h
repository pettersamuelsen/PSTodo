//
//  PSManagedTableViewController.h
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

@import UIKit;

@interface PSManagedTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

/**
 *  The table view to be used together with the NSFetchedResultsController
 */
@property (nonatomic, weak) IBOutlet UITableView *tableView;

/**
 *  The NSFetchedResultsController is responsible for updating the tableview based on insertions, removals, moves and deletions in the data model.
 */
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

/**
 *  The entity name of the NSManagedObject to be used in the NSFetchedResultsController
 *
 *  @return The string representation of the entity name
 */
- (NSString *)entityName;

/**
 *  The predicate to be used in the NSFetchRequest for the NSFetchedResultsController
 *
 *  @return A valid predicate for the entity. Defaults to nil.
 */
- (NSPredicate *)predicate;

/**
 *  An array full of NSSortDescriptors to be used in the NSFetchRequest to determine how to sort the entities in the NSFetchedResultsController
 *
 *  @return An array of NSSortDescriptors. This is required by the NSFetchedResultsController. Defaults to nil.
 */
- (NSArray *)sortDescriptors;

/**
 *  The section name key path in the entity to create the sections.
 *
 *  @return A NSString with the value of the section name key path. Defaults to nil.
 */
- (NSString *)sectionNameKeyPath;

/**
 *  The animation to be used when inserting, updating, moving and removing cells in the table view.
 *
 *  @return Defaults to UITableViewRowAnimationFade.
 */
- (UITableViewRowAnimation)tableViewRowAnimation;

/**
 *  The managedObjectContext to be used in the NSFetchedResultsController
 *
 *  @return Returns an instance of a NSManagedObjectContext. Defaults to nil.
 */
- (NSManagedObjectContext *)managedObjectContext;

@end