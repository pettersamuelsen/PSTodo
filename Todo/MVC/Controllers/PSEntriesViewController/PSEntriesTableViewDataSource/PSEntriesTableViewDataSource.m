//
//  PSEntriesTableViewDataSource.m
//  Todo
//
//  Created by Petter Samuelsen on 3/6/15.
//  Copyright (c) 2015 Petter Samuelsen. All rights reserved.
//

#import "PSEntriesTableViewDataSource.h"
#import "PSEntry.h"
#import "PSEntryTableViewCell.h"

@interface PSEntriesTableViewDataSource()
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation PSEntriesTableViewDataSource

#pragma mark - Init
- (id)initWithFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
                        cellIdentifier:(NSString *)cellIdentifier {
    self = [super init];
    if (self) {
        self.cellIdentifier = [cellIdentifier copy];
        self.fetchedResultsController = fetchedResultsController;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
    PSEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    cell.title = entry.title;
    cell.completed = entry.completed.boolValue;
    
    return cell;
}

@end
