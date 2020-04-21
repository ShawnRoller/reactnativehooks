//
//  ReactNativeManager.h
//  ReactNativeHooks
//
//  Created by Shawn Roller on 4/21/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ReactNativeManagerDelegate
- (void)testTapped;
@end

@interface RCT_EXTERN_MODULE(ReactNativeManager, RCTEventEmitter)

RCT_EXTERN_METHOD(setDelegate)

@end

NS_ASSUME_NONNULL_END
