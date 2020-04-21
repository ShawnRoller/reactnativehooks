//
//  NativeViewController.m
//  ReactNativeHooks
//
//  Created by Shawn Roller on 4/21/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "NativeViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface NativeViewController ()
@end

@implementation NativeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Mixed react-native and iOS views";
    
  NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  UIView *reactView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                  moduleName:@"SimpleTextComponent"
                                           initialProperties:nil
                                               launchOptions:nil];
  [self.view addSubview:reactView];
  [reactView setTranslatesAutoresizingMaskIntoConstraints:NO];

  NSLayoutConstraint *leadingConstraint = [reactView.leadingAnchor constraintEqualToAnchor:[self.view leadingAnchor]];
  NSLayoutConstraint *bottomConstraint = [reactView.bottomAnchor constraintEqualToAnchor:[self.view bottomAnchor]];
  NSLayoutConstraint *trailingConstraint = [reactView.trailingAnchor constraintEqualToAnchor:[self.view trailingAnchor]];
  NSLayoutConstraint *topConstraint = [reactView.topAnchor constraintEqualToAnchor:[self.view centerYAnchor]];

  [self.view addConstraints:@[leadingConstraint, bottomConstraint, trailingConstraint, topConstraint]];
  [self.view setNeedsUpdateConstraints];
}

- (IBAction)tappedTest:(id)sender
{
  [self.delegate testTapped];
}

@end
