//
//  PSTransitionAnimator.h
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  Wether to perform the animation in reverse or not
 */
@property (nonatomic, assign) BOOL reverse;

@end
