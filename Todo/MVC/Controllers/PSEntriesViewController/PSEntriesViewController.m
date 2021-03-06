//
//  PSEntriesViewController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSEntriesViewController.h"
#import "PSEntry+CoreDataAdditions.h"
#import "PSEntryTableViewCell.h"
#import "PSCoreDataManager.h"
#import "PSCreateViewController.h"
#import "PSTheme.h"
#import "PSEntriesTableViewDataSource.h"
#import "PSEntriesFetchedResultsControllerDelegate.h"
#import "PSTransitionDelegate.h"

@interface PSEntriesViewController () <UIViewControllerTransitioningDelegate, PSCreateViewControllerDelegate>
@property (nonatomic, strong) PSEntriesTableViewDataSource *entriesTableViewDataSource;
@property (nonatomic, strong) PSEntriesFetchedResultsControllerDelegate *entriesFetchedResultsControllerDelegate;
@property (nonatomic, strong) PSTransitionDelegate *transitionDelegate;
@end

@implementation PSEntriesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupView];
  [self setupDataSource];
  [self setupDelegate];
  [self registerTableViewCells];
}

#pragma mark - Setup
- (void)setupView {
  // Set the add button in the top right corner
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                         target:self
                                                                                         action:@selector(addButtonPressed:)];
  // Set the title of the view controller
  self.title = NSLocalizedString(@"Todo", nil);
  
  // Set the colors
  self.view.backgroundColor = [PSTheme colorSecondary];
}

- (void)setupDataSource {
    // Entries tableview data source
    self.entriesTableViewDataSource = [[PSEntriesTableViewDataSource alloc] initWithFetchedResultsController:self.fetchedResultsController
                                                                                              cellIdentifier:PSEntryTableViewCellIdentifier];
    self.tableView.dataSource = self.entriesTableViewDataSource;
}

- (void)setupDelegate {
    // NSFetchedResultsController delegate
    self.entriesFetchedResultsControllerDelegate = [[PSEntriesFetchedResultsControllerDelegate alloc] initWithTableView:self.tableView];
    self.fetchedResultsController.delegate = self.entriesFetchedResultsControllerDelegate;
    
    // Transition delegate
    self.transitionDelegate = [[PSTransitionDelegate alloc] init];
}

- (void)registerTableViewCells {
  // Register the todo cell
  UINib *todoCellNib = [UINib nibWithNibName:NSStringFromClass([PSEntryTableViewCell class]) bundle:nil];
  [self.tableView registerNib:todoCellNib forCellReuseIdentifier:PSEntryTableViewCellIdentifier];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  // A cell was tapped, so toggle the completion of the entry
  PSEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  [entry toggleCompleted];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [PSTheme defaultCellHeight];
}

#pragma mark - Actions
- (void)addButtonPressed:(id)sender {
  PSCreateViewController *createViewController = [[PSCreateViewController alloc] init];
  createViewController.transitioningDelegate = self.transitioningDelegate;
  createViewController.modalPresentationStyle = UIModalPresentationCustom;
  createViewController.delegate = self;
  [self presentViewController:createViewController animated:YES completion:nil];
}

#pragma mark - Create Entry
- (void)createEntryWithTitle:(NSString *)title {
  [PSEntry createWithTitle:title];
}

#pragma mark - PSCreateViewControllerDelegate
- (void)psCreateViewController:(PSCreateViewController *)viewController didSubmitWithTitle:(NSString *)title {
  [self createEntryWithTitle:title];
}

#pragma mark - PSManagedTableViewController
- (NSString *)entityName {
  return NSStringFromClass([PSEntry class]);
}

- (NSArray *)sortDescriptors {
  return @[[NSSortDescriptor sortDescriptorWithKey:@"completed" ascending:YES],
           [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]];
}

- (NSManagedObjectContext *)managedObjectContext {
  return [[PSCoreDataManager sharedManager] managedObjectContext];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
