//
//  UITextField+Validation.m
//  Todo
//
//  Created by Petter Samuelsen on 3/7/15.
//  Copyright (c) 2015 Petter Samuelsen. All rights reserved.
//

#import "UITextField+Validation.h"

@implementation UITextField (Validation)

- (BOOL)isValid {
    return self.text.length > 0;
}

@end
