import React, { useState, useEffect } from 'react';
import { NativeModules, NativeEventEmitter, View, Text } from 'react-native';

const NativeEvents = new NativeEventEmitter(NativeModules.ReactNativeManager);

const SimpleTextComponent = () => {
  const [nativeIsSetup, setNativeIsSetup] = useState(false);
  const [textToShow, setTextToShow] = useState('react-native');

  useEffect(() => {
    if (!nativeIsSetup) {
      setupNativeVC();
    }
  }, [nativeIsSetup]);

  const setupNativeVC = () => {
    // Set a listener to receive the menu taps
    NativeEvents.addListener('test', () => {
      testTapped();
    });

    NativeModules.ReactNativeManager.setDelegate();

    setNativeIsSetup(true);
  };

  const testTapped = () => {
    console.log('test tapped');
    setTextToShow(getTextToShow());
  };

  const getTextToShow = () => {
    return textToShow === 'react-native' ? '' : 'react-native';
  };

  return (
    <View style={{ flex: 1 }}>
      <Text>{textToShow}</Text>
    </View>
  );
};

export default SimpleTextComponent;
