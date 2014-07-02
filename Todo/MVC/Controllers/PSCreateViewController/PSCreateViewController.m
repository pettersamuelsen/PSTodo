//
//  PSCreateViewController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/30/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSCreateViewController.h"
#import "PSTheme.h"

@interface PSCreateViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UIImageView *dimmedBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *seperatorImageView;
@property (nonatomic, weak) IBOutlet UIView *alertContainerView;
@property (nonatomic, weak) IBOutlet UITextField *titleTextField;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;
@end

@implementation PSCreateViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupView];
}

#pragma mark - Setup
- (void)setupView {
  // Add a tap gesture recognizer to the background view
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(backgroundTapped:)];
  [self.dimmedBackgroundImageView addGestureRecognizer:tapGestureRecognizer];
  
  // Set styles
  self.dimmedBackgroundImageView.backgroundColor = [PSTheme colorSecondary];
  self.seperatorImageView.backgroundColor = [PSTheme colorSecondary];
  
  // Alert Container View
  self.alertContainerView.backgroundColor = [PSTheme colorSecondaryDarken];
  self.alertContainerView.layer.cornerRadius = [PSTheme defaultCornerRadius];
  
  // Title Textfield
  self.titleTextField.font = [PSTheme todoTitleFont];
  self.titleTextField.textColor = [PSTheme colorWhite];
  
  // Submit Button
  self.submitButton.titleLabel.font = [PSTheme todoTitleFont];
  self.submitButton.backgroundColor = [PSTheme colorPrimary];
  self.submitButton.layer.cornerRadius = [PSTheme defaultCornerRadius];
  [self.submitButton setTitleColor:[PSTheme colorWhite] forState:UIControlStateNormal];
  [self.submitButton setTitle:NSLocalizedString(@"Submit", nil) forState:UIControlStateNormal];
  
  // Make the textfield the first responder
  [self.titleTextField becomeFirstResponder];
}

#pragma mark - Actions
- (void)backgroundTapped:(UITapGestureRecognizer *)gestureRecognizer {
  // Background was tapped, just dismiss the current view
  [self dismissView];
}

- (IBAction)submitButtonPressed:(id)sender {
  // Perform submission
  [self submitWithTitle:self.titleTextField.text];
}

- (void)submitWithTitle:(NSString *)title {
  // Return if the textfield is not valid
  if(![self isTextFieldValid]){
    return;
  }
  
  // Tell the delegate that a title was submitted
  if([self.delegate respondsToSelector:@selector(psCreateViewController:didSubmitWithTitle:)]){
    [self.delegate psCreateViewController:self didSubmitWithTitle:title];
  }
  
  // Dismiss the current view controller
  [self dismissView];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  // Perform submission
  [self submitWithTitle:textField.text];
  
  return NO;
}

#pragma mark - Animations
- (void)animateWithDirection:(PSAnimationDirection)direction
                    duration:(NSTimeInterval)duration
                  completion:(void (^)())completion {
  
  // Set start values
  CGFloat dimmedBackgroundAlphaStart;
  CGRect alertContainerViewFrameStart = self.alertContainerView.frame;
  CGFloat springValue;
  
  // Set end values
  CGFloat dimmedBackgroundAlphaEnd;
  CGRect alertContainerViewFrameEnd = self.alertContainerView.frame;
  
  switch (direction) {
    case PSAnimationDirectionIn:
      dimmedBackgroundAlphaStart = 0.0f;
      dimmedBackgroundAlphaEnd = [PSTheme dimmedBackgroundAlpha];
      alertContainerViewFrameStart.origin.y = -alertContainerViewFrameStart.size.height;
      springValue = kDefaultAnimationSpringValue;
      break;
      
    case PSAnimationDirectionOut:
      dimmedBackgroundAlphaStart = [PSTheme dimmedBackgroundAlpha];
      dimmedBackgroundAlphaEnd = 0.0f;
      alertContainerViewFrameEnd.origin.y = -alertContainerViewFrameEnd.size.height;
      springValue = kDefaultAnimationSpringValueNone;
      
      break;
      
    default:
      break;
  }
  
  // Set the dimmed background view alpha default value
  self.dimmedBackgroundImageView.alpha = dimmedBackgroundAlphaStart;
  
  // Animate in the dimmed background image view
  [UIView animateWithDuration:kDefaultAnimationDurationFast animations:^{
    self.dimmedBackgroundImageView.alpha = dimmedBackgroundAlphaEnd;
  } completion:nil];
  
  // Animate in the alert container view
  // Set the start frame of the alert container view
  self.alertContainerView.frame = alertContainerViewFrameStart;
  
  [UIView animateWithDuration:duration
                        delay:0.0f
       usingSpringWithDamping:springValue
        initialSpringVelocity:springValue
                      options:UIViewAnimationOptionCurveEaseIn animations:^{
                        
                        // Set the end frame of the alert container view
                        self.alertContainerView.frame = alertContainerViewFrameEnd;
                        
                      } completion:^(BOOL finished) {
                        if(completion){
                          completion();
                        }
                      }];
}

#pragma mark - Helpers
- (void)dismissView {
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)isTextFieldValid {
  // Check to see if the title text field is not empty
  return self.titleTextField.text.length > 0;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
