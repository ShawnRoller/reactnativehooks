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
  return @[@"test"];
}

- (void)testTapped
{
  [self sendEventWithName:@"test" body:nil];
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
