import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import GPRNGeometryUtils from '@goparrot/react-native-geometry-utils';

export default function App() {
  const [contains, setContains] = React.useState<boolean | undefined>();
  const [contains2, setContains2] = React.useState<boolean | undefined>();

  React.useEffect(() => {
    const polygon = [
      { latitude: 0, longitude: 0 },
      { latitude: 0, longitude: 1 },
      { latitude: 1, longitude: 1 },
      { latitude: 1, longitude: 0 },
      { latitude: 0, longitude: 0 }, // last point has to be same as first point
    ];

    const pointIn = {
      latitude: 0.1,
      longitude: 0.1,
    };

    const pointOut = {
      latitude: 0.1,
      longitude: -0.1,
    };

    GPRNGeometryUtils.containsLocation(pointIn, polygon).then(setContains);
    GPRNGeometryUtils.containsLocation(pointOut, polygon).then(setContains2);
  }, []);

  return (
    <View style={styles.container}>
      <Text>PointIn: {`${contains}`}</Text>
      <Text>PointOut: {`${contains2}`}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
