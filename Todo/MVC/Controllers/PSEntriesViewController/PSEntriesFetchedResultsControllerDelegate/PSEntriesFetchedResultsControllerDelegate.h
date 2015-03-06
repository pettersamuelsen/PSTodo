//
//  PSEntriesFetchedResultsControllerDelegate.h
//  Todo
//
//  Created by Petter Samuelsen on 3/6/15.
//  Copyright (c) 2015 Petter Samuelsen. All rights reserved.
//

@import Foundation;

@interface PSEntriesFetchedResultsControllerDelegate : NSObject <NSFetchedResultsControllerDelegate>

- (id)initWithTableView:(UITableView *)tableView;

@end
