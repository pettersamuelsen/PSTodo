//
//  PSCreateViewController.h
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

@import UIKit;

@class PSCreateViewController;

@protocol PSCreateViewControllerDelegate <NSObject>
- (void)psCreateViewController:(PSCreateViewController *)viewController
            didSubmitWithTitle:(NSString *)title;
@end

@interface PSCreateViewController : UIViewController
@property (nonatomic, weak) id<PSCreateViewControllerDelegate> delegate;
@end
