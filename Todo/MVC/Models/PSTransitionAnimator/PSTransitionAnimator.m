//
//  PSTransitionAnimator.m
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSTransitionAnimator.h"
#import "PSCreateViewController.h"
#import "PSTransition.h"

@implementation PSTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return PSDefaultAnimationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  UIView *containerView = [transitionContext containerView];
  UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
  UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
  NSTimeInterval duration = [self transitionDuration:transitionContext];
  
  if(self.isPresenting){
    [containerView addSubview:toView];
    toView.userInteractionEnabled = YES;
    
    // Animate in the toViewViewController
    UIViewController<PSTransition> *toViewController = (UIViewController<PSTransition> *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [toViewController animateWithDirection:PSAnimationDirectionIn duration:duration completion:^{
      [transitionContext completeTransition:YES];
    }];
  }else{
    [containerView insertSubview:toView belowSubview:fromView];
    fromView.userInteractionEnabled = NO;
    
    // Animate out the fromViewController
    UIViewController<PSTransition> *fromViewController = (UIViewController<PSTransition> *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    [fromViewController animateWithDirection:PSAnimationDirectionOut duration:duration completion:^{
      [transitionContext completeTransition:YES];
    }];
  }
}

@end
