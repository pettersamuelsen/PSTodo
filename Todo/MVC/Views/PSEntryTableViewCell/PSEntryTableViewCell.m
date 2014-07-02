//
//  PSEntryTableViewCell.m
//  Todo
//
//  Created by Petter Samuelsen on 6/29/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSEntryTableViewCell.h"
#import "PSTheme.h"

@interface PSEntryTableViewCell()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *seperatorImageView;
@end

@implementation PSEntryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if(self){
    [self setupView];
  }
  
  return self;
}

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setupView];
}

#pragma mark - Setup
- (void)setupView {
  // Set styles
  self.titleLabel.font = [PSTheme todoTitleFont];
  self.seperatorImageView.backgroundColor = [PSTheme colorSecondaryLighten];
  self.contentView.backgroundColor = [PSTheme colorSecondary];
}

#pragma mark - Setters
- (void)setTitle:(NSString *)title {
  _title = title;
  
  // Update title label
  [self updateTitleLabelWithTitle:title isCompleted:self.isCompleted];
}

- (void)setCompleted:(BOOL)completed {
  _completed = completed;
  
  // Update title label
  [self updateTitleLabelWithTitle:self.titleLabel.text isCompleted:completed];
}

#pragma mark - Helpers
- (void)updateTitleLabelWithTitle:(NSString *)title isCompleted:(BOOL)isCompleted {
  self.titleLabel.text = title;
  self.titleLabel.textColor = isCompleted ? [PSTheme colorSecondaryLighten] : [PSTheme colorWhite];
  
  // Apply the strike through if the task is completed
  [PSTheme applyStrikeThroughStyle:isCompleted toLabel:self.titleLabel];
}

@end
