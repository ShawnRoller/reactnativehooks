//
//  ReactNativeManager.m
//  ReactNativeHooks
//
//  Created by Shawn Roller on 4/21/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "ReactNativeManager.h"
#import "AppDelegate.h"
#import "NativeViewController.h"

@interface ReactNativeManager () <ReactNativeManagerDelegate>
@end

@implementation ReactNativeManager

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"test", @"displayText"];
}

- (void)testTapped
{
  [self sendEventWithName:@"test" body:nil];
}

- (void)displayText
{
  [self sendEventWithName:@"displayText" body:@{@"text": @"this is a test"}];
}

- (void)setDelegate
{
  dispatch_async(dispatch_get_main_queue(), ^{
    AppDelegate *ad = [AppDelegate getInstance];
    NativeViewController *nativeVC = (NativeViewController *)[ad getVisibleViewController];
    nativeVC.delegate = self;
  });
}

@end
