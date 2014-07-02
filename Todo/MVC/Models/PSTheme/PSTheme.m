//
//  PSTheme.m
//  Todo
//
//  Created by Petter Samuelsen on 6/29/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSTheme.h"

typedef enum {
  PSFontTypeRegular = 0,
  PSFontTypeSemiBold,
  PSFontTypeBold
} PSFontType;

@implementation PSTheme

#pragma mark - Cell Values
+ (CGFloat)defaultCellHeight {
  return 60.0f;
}

#pragma mark - Misc Values
+ (CGFloat)defaultCornerRadius {
  return 3.0f;
}

+ (CGFloat)dimmedBackgroundAlpha {
  return 0.8f;
}

+ (BOOL)isNavigationBarTranslucent {
  return NO;
}

#pragma mark - Color Values
+ (UIColor *)colorPrimary {
  return [UIColor colorWithRed:216.0f/255.0f green:54.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}

+ (UIColor *)colorSecondary {
  return [UIColor colorWithRed:29.0f/255.0f green:29.0f/255.0f blue:38.0f/255.0f alpha:1.0f];
}

+ (UIColor *)colorSecondaryLighten {
  return [UIColor colorWithRed:43.0f/255.0f green:43.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
}

+ (UIColor *)colorSecondaryDarken {
  return [UIColor colorWithRed:16.0f/255.0f green:16.0f/255.0f blue:24.0f/255.0f alpha:1.0f];
}

+ (UIColor *)colorWhite {
  return [UIColor whiteColor];
}

#pragma mark - Font Values
+ (NSString *)fontRegular {
  return @"OpenSans";
}

+ (NSString *)fontSemiBold {
  return @"OpenSans-Semibold";
}

+ (NSString *)fontBold {
  return @"OpenSans-Bold";
}

#pragma mark - Font Getters
+ (UIFont *)todoTitleFont {
  return [self fontWithFontType:PSFontTypeSemiBold size:14.0f];
}

#pragma mark - Font Helpers
+ (UIFont *)fontWithFontType:(PSFontType)fontType size:(CGFloat)size {
  return [UIFont fontWithName:[self fontNameForFontType:fontType] size:size];
}

+ (NSString *)fontNameForFontType:(PSFontType)fontType {
  switch (fontType) {
    case PSFontTypeSemiBold:
      return [self fontSemiBold];
      break;
      
    case PSFontTypeBold:
      return [self fontBold];
      break;
      
    default:
      return [self fontRegular];
      break;
  }
}

#pragma mark - Strike Through
+ (void)applyStrikeThroughStyle:(BOOL)applyStrikeThrough toLabel:(UILabel *)label {
  NSDictionary *attributes = nil;
  
  // Only apply the strike through applyStrikeThrough is set to yes, otherwise override it
  if(applyStrikeThrough){
    attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
  }
  
  NSAttributedString *attributedTitleString = [[NSAttributedString alloc] initWithString:label.text
                                                                              attributes:attributes];
  label.attributedText = attributedTitleString;
}

#pragma mark - Apply Theme
+ (void)applyTheme {
  [[UINavigationBar appearance] setBarTintColor:[self colorPrimary]];
  [[UINavigationBar appearance] setTintColor:[self colorWhite]];
  [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [self colorWhite],
                                                         NSFontAttributeName: [self fontWithFontType:PSFontTypeSemiBold size:16.0f]}];
}

@end
