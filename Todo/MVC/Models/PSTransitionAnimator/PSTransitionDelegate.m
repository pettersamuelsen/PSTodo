//
//  PSTransitionDelegate.m
//  Todo
//
//  Created by Petter Samuelsen on 3/7/15.
//  Copyright (c) 2015 Petter Samuelsen. All rights reserved.
//

#import "PSTransitionDelegate.h"
#import "PSTransitionAnimator.h"

@implementation PSTransitionDelegate

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

@end
