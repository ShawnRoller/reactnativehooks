//
//  NativeViewController.h
//  ReactNativeHooks
//
//  Created by Shawn Roller on 4/21/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactNativeManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NativeViewController: UIViewController

@property (strong, nonatomic) id<ReactNativeManagerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
