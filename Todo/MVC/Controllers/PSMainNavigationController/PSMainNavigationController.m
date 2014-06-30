//
//  PSMainNavigationController.m
//  Todo
//
//  Created by Petter Samuelsen on 6/29/14.
//  Copyright (c) 2014 Petter Samuelsen. All rights reserved.
//

#import "PSMainNavigationController.h"
#import "PSTheme.h"

@implementation PSMainNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.navigationBar.translucent = [PSTheme isNavigationBarTranslucent];
  }
  return self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
