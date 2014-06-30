//
//  PSEntryTableViewCell.h
//  Todo
//
//  Created by Petter Samuelsen on 6/29/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSEntryTableViewCell : UITableViewCell

/**
 *  The title of the cell
 */
@property (nonatomic, copy) NSString *title;

/**
 *  Wether the cell should be in completed state or not.
 */
@property (nonatomic, assign, getter = isCompleted) BOOL completed;

@end
