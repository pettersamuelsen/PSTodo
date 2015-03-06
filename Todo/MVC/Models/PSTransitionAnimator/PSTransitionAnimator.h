//
//  PSTransitionAnimator.h
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

@import Foundation;

@interface PSTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  Whether the view contorller is presenting or not
 */
@property (nonatomic, assign, getter=isPresenting) BOOL presenting;

@end
