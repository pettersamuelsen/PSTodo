//
//  PSTransitionAnimator.m
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSTransitionAnimator.h"
#import "PSCreateViewController.h"

@implementation PSTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return PSDefaultAnimationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  UIView *inView = [transitionContext containerView];
  
  PSCreateViewController *toViewController = (PSCreateViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  PSCreateViewController *fromViewController = (PSCreateViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  
  UIView *toView = toViewController.view;
  UIView *fromView = fromViewController.view;
  
  NSTimeInterval duration = [self transitionDuration:transitionContext];
  
  if(self.isPresenting){
    [inView addSubview:toView];
    toView.userInteractionEnabled = YES;
    
    // Animate in the toView
    [toViewController animateWithDirection:PSAnimationDirectionIn duration:duration completion:^{
      [transitionContext completeTransition:YES];
    }];
  }else{
    [inView insertSubview:toView belowSubview:fromView];
    fromView.userInteractionEnabled = NO;
    
    // Animate out the fromView
    [fromViewController animateWithDirection:PSAnimationDirectionOut duration:duration completion:^{
      [transitionContext completeTransition:YES];
    }];
  }
}

@end
