//
//  PSMainViewController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSMainViewController.h"
#import "PSEntry.h"
#import "PSEntry+CoreDataAdditions.h"
#import "PSEntryTableViewCell.h"
#import "PSCoreDataManager.h"
#import "PSCreateViewController.h"
#import "PSTransitionAnimator.h"
#import "PSTheme.h"

static NSString *entryCellIdentifier = @"PSEntryCellIdentifier";

@interface PSMainViewController () <UIViewControllerTransitioningDelegate, PSCreateViewControllerDelegate>

@end

@implementation PSMainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupView];
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

- (void)registerTableViewCells {
  // Register the todo cell
  UINib *todoCellNib = [UINib nibWithNibName:NSStringFromClass([PSEntryTableViewCell class]) bundle:nil];
  [self.tableView registerNib:todoCellNib forCellReuseIdentifier:entryCellIdentifier];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [PSTheme defaultCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  PSEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  PSEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCellIdentifier];
  
  cell.title = entry.title;
  cell.completed = entry.completed.boolValue;
  
  return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  // A cell was tapped, so toggle the completion of the entry
  PSEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
  [entry toggleCompleted];
}

#pragma mark - Actions
- (void)addButtonPressed:(id)sender {
  PSCreateViewController *createViewController = [[PSCreateViewController alloc] init];
  createViewController.transitioningDelegate = self;
  createViewController.modalPresentationStyle = UIModalPresentationCustom;
  createViewController.delegate = self;
  
  [self presentViewController:createViewController animated:YES completion:nil];
}

#pragma mark - Create Entry
- (void)createEntryWithTitle:(NSString *)title {
  PSEntry *entry = [PSEntry createInManagedObjectContext:[self managedObjectContext]];
  entry.title = title;
  entry.createdAt = [NSDate date];
  [entry save];
}

#pragma mark - PSCreateViewControllerDelegate
- (void)psCreateViewController:(PSCreateViewController *)viewController didSubmitWithTitle:(NSString *)title {
  [self createEntryWithTitle:title];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
  PSTransitionAnimator *transitionAnimator = [[PSTransitionAnimator alloc] init];
  transitionAnimator.presenting = YES;
  return transitionAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  PSTransitionAnimator * transitionAnimator = [[PSTransitionAnimator alloc] init];
  return transitionAnimator;
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
