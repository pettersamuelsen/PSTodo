//
//  PSEntry.h
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PSEntry : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * completed;

@end
