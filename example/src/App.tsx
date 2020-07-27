import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import GPRNGeometryUtils from '@goparrot/react-native-geometry-utils';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();
  const [contains, setContains] = React.useState<boolean | undefined>();

  React.useEffect(() => {
    const polygon = [
      { latitude: 0, longitude: 0 },
      { latitude: 1, longitude: 0 },
      { latitude: 1, longitude: 1 },
      { latitude: 0, longitude: 1 },
      { latitude: 0, longitude: 0 }, // last point has to be same as first point
    ];

    let point = {
      latitude: 0,
      longitude: 0,
    };

    GPRNGeometryUtils.multiply(3, 7).then(setResult);
    GPRNGeometryUtils.containsLocation(point, polygon).then(setContains);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
      <Text>Contains: {`${contains}`}</Text>
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
