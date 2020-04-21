/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "NativeViewController.h"

static AppDelegate *_instance;

@implementation AppDelegate

+ (AppDelegate *)getInstance{
    return _instance;
}

- (UIViewController *)getVisibleViewController
{
    UIViewController *visibleViewController = self.window.rootViewController;
    while(visibleViewController.presentedViewController != nil){
        visibleViewController = visibleViewController.presentedViewController;
    }
    if([visibleViewController isKindOfClass:[UINavigationController class]]){
        visibleViewController = ((UINavigationController *)visibleViewController).viewControllers.lastObject;
    }
    return visibleViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  _instance = self;
  
  NativeViewController *rootViewController = [[NativeViewController alloc] initWithNibName:@"NativeViewController" bundle:[NSBundle mainBundle]];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
