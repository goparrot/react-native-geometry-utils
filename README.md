# @goparrot/react-native-geometry-utils

Google maps geometry utils for react native

> This library is a clone of [react-native-geo-fencing](https://github.com/surialabs/react-native-geo-fencing) with several improvements.

## Pre-install

Native module for iOS is written in Swift.

> If your app project does not contain any Swift code, a workaround can be a single empty .swift file and an empty bridging header.

You may try [react-native-swift](https://github.com/rhdeck/react-native-swift).

_If you had problems installing this package for iOS and found some solutions please create an issue or a PR that updates the README._

## Installation

```sh
npm install @goparrot/react-native-geometry-utils
```

## Usage

```js
import {
  polygonContainsLocation,
  circleContainsLocation,
  computeDistanceBetween
} from "@goparrot/react-native-geometry-utils";

// ...

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

await polygonContainsLocation(pointIn, polygon); // true
await polygonContainsLocation(pointOut, polygon); // false
await circleContainsLocation(pointIn, cicle); // true
await circleContainsLocation(pointOut, cicle); // false
await computeDistanceBetween(pointIn, pointOut); // 35162.86 meters
```

## API

### Interfaces

```ts
interface LatLng {
  latitude: number;
  longitude: number;
}

interface Circle {
  center: LatLng;
  radius: number;
}
```

### Functions

```ts
polygonContainsLocation(point: LatLng, polygon: LatLng[]): Promise<boolean>;

circleContainsLocation(point: LatLng, circle: Circle): Promise<boolean>;

computeDistanceBetween(from: LatLng, to: LatLng): Promise<number>;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
