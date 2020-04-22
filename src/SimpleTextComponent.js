import React, { useState, useEffect, useCallback, useRef } from 'react';
import { NativeModules, NativeEventEmitter, View, Text } from 'react-native';

const NativeEvents = new NativeEventEmitter(NativeModules.ReactNativeManager);

const STEP = {
  one: 1,
  two: 2,
  three: 3,
};

const SimpleTextComponent = () => {
  const [step, setStep] = useState(STEP.one);

  const processText = useCallback(
    (text) => {
      console.log(`processText for step ${step} with text ${text}`);

      switch (step) {
        case 1:
          setStep(2);
          break;
        case 2:
          setStep(3);
          break;
        case 3:
          setStep(1);
          break;
      }
    },
    [step],
  );

  useEffect(() => {
    const subscription = NativeEvents.addListener('displayText', (response) => {
      processText(response.text);
    });

    NativeModules.ReactNativeManager.setDelegate();

    return () => subscription.remove();
  }, [processText]);

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
      <Text>{step}</Text>
    </View>
  );
};

export default SimpleTextComponent;
