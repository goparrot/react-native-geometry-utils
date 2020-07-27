import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import {
  polygonContainsLocation,
  circleContainsLocation,
  computeDistanceBetween,
} from '@goparrot/react-native-geometry-utils';

export default function App() {
  const [contains, setContains] = React.useState<boolean | undefined>();
  const [contains2, setContains2] = React.useState<boolean | undefined>();
  const [contains3, setContains3] = React.useState<boolean | undefined>();
  const [contains4, setContains4] = React.useState<boolean | undefined>();
  const [distance, setDistance] = React.useState<number | undefined>();

  React.useEffect(() => {
    const polygon = [
      { latitude: 0, longitude: 0 },
      { latitude: 0, longitude: 1 },
      { latitude: 1, longitude: 1 },
      { latitude: 1, longitude: 0 },
      { latitude: 0, longitude: 0 }, // last point has to be same as first point
    ];

    const cicle = {
      center: {
        latitude: 0,
        longitude: 0,
      },
      radius: 15742.949, // approximate radius of 0.1 degree in meters
    };

    const pointIn = {
      latitude: 0.1,
      longitude: 0.1,
    };

    const pointOut = {
      latitude: 0.2,
      longitude: -0.2,
    };

    polygonContainsLocation(pointIn, polygon).then(setContains);
    polygonContainsLocation(pointOut, polygon).then(setContains2);
    circleContainsLocation(pointIn, cicle).then(setContains3);
    circleContainsLocation(pointOut, cicle).then(setContains4);
    computeDistanceBetween(pointIn, pointOut).then(setDistance);
  }, []);

  return (
    <View style={styles.container}>
      <Text>PointIn Polygon: {`${contains}`}</Text>
      <Text>PointOut Polygon: {`${contains2}`}</Text>
      <Text>PointIn Circle: {`${contains3}`}</Text>
      <Text>PointOut Circle: {`${contains4}`}</Text>
      <Text>Distance between PointIn and PointOut: {`${distance}`}</Text>
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
