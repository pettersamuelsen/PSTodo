//
//  PSCoreDataManager.h
//  Todo
//
//  Created by Petter Samuelsen on 6/26/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSCoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (PSCoreDataManager *)sharedManager;
- (void)saveContext;

@end
