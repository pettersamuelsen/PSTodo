//
//  PSTheme.h
//  Todo
//
//  Created by Petter Samuelsen on 6/29/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTheme : NSObject

/**
 *  Applies the global theme to the application
 */
+ (void)applyTheme;

/**
 *  The primary color of the application.
 *
 *  @return A UIColor representation of the primary color
 */
+ (UIColor *)colorPrimary;

/**
 *  The secondary color of the application. This color is used to back up the primary color.
 *
 *  @return A UIColor representation of the secondary color.
 */
+ (UIColor *)colorSecondary;

/**
 *  A lighter version of the secondary color. This color is used to back up the secondary color.
 *
 *  @return A UIColor representation of the ligtened secondary color.
 */
+ (UIColor *)colorSecondaryLighten;

/**
 *  A darker version of the secondary color. This color is used to back up the secondary color.
 *
 *  @return A UIColor representation of the darkened secondary color.
 */
+ (UIColor *)colorSecondaryDarken;

/**
 *  A representation of a white color to be used in the application
 *
 *  @return A UIColor representation of the white color
 */
+ (UIColor *)colorWhite;

/**
 *  The default radius of corner radiuses to be used throughout the application.
 *
 *  @return A CGFloat version with the default corner radius value
 */
+ (CGFloat)defaultCornerRadius;

/**
 *  The default height of table view cells
 *
 *  @return A CGFloat with the default height of table view cells
 */
+ (CGFloat)defaultCellHeight;

/**
 *  The alpha of the dimmed background view
 *
 *  @return The value of the alpha of the dimmed background view
 */
+ (CGFloat)dimmedBackgroundAlpha;

/**
 *  Wether the navigation bar should be translucent or not
 *
 *  @return A BOOL with the value of the navigation's bar translucency.
 */
+ (BOOL)isNavigationBarTranslucent;

/**
 *  The font of all the todo labels
 *
 *  @return A UIFont representation of the todo's title font
 */
+ (UIFont *)todoTitleFont;

/**
 *  Applies a strike through style to the given label
 *
 *  @param applyStrikeThroughStyle Wether or not to apply the strike through
 *  @param label                   The label to apply the style
 */
+ (void)applyStrikeThroughStyle:(BOOL)applyStrikeThrough toLabel:(UILabel *)label;

@end
