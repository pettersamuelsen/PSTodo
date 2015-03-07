//
//  PSTransition.h
//  Todo
//
//  Created by Petter Samuelsen on 3/7/15.
//  Copyright (c) 2015 Petter Samuelsen. All rights reserved.
//

@import Foundation;

typedef NS_ENUM(NSUInteger, PSAnimationDirection) {
    PSAnimationDirectionIn = 0,
    PSAnimationDirectionOut
};

@protocol PSTransition <NSObject>

/**
 *  Animates the view controller with the given direction
 *
 *  @param direction  The direction to animate the view controller
 *  @param duration   The duration of the animation
 *  @param completion A completion block which is fired when the animation has completed
 */
- (void)animateWithDirection:(PSAnimationDirection)direction
                    duration:(NSTimeInterval)duration
                  completion:(void (^)())completion;
@end
