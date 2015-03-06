//
//  PSCreateViewController.h
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSUInteger, PSAnimationDirection) {
    PSAnimationDirectionIn = 0,
    PSAnimationDirectionOut
};

@class PSCreateViewController;

@protocol PSCreateViewControllerDelegate <NSObject>
- (void)psCreateViewController:(PSCreateViewController *)viewController
            didSubmitWithTitle:(NSString *)title;
@end

@interface PSCreateViewController : UIViewController

@property (nonatomic, weak) id<PSCreateViewControllerDelegate> delegate;

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
