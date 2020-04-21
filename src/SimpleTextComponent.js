import React, { useState, useEffect, useCallback } from 'react';
import { NativeModules, NativeEventEmitter, View, Text } from 'react-native';

const NativeEvents = new NativeEventEmitter(NativeModules.ReactNativeManager);

const SimpleTextComponent = () => {
  const [nativeIsSetup, setNativeIsSetup] = useState(false);
  const [textToShow, setTextToShow] = useState('react-native');

  const testTapped = useCallback(() => {
    console.log('test tapped');
    console.log(textToShow);
    setTextToShow(textToShow === 'react-native' ? '' : 'react-native');
  }, [textToShow]);

  useEffect(() => {
    // Set a listener to receive the menu taps
    const subscription = NativeEvents.addListener('test', () => {
      testTapped();
    });

    NativeModules.ReactNativeManager.setDelegate();

    return () => subscription.remove();
  }, [testTapped]);

  return (
    <View style={{ flex: 1 }}>
      <Text>{textToShow}</Text>
    </View>
  );
};

export default SimpleTextComponent;
