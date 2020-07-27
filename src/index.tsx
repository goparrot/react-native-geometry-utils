import { NativeModules } from 'react-native';

export interface LatLng {
  latitude: number;
  longitude: number;
}

export interface Circle {
  center: LatLng;
  radius: number;
}

type GeometryUtilsType = {
  polygonContainsLocation(point: LatLng, polygon: LatLng[]): Promise<boolean>;
  circleContainsLocation(point: LatLng, circle: Circle): Promise<boolean>;
  computeDistanceBetween(from: LatLng, to: LatLng): Promise<number>;
};

const GPRNGeometryUtils: GeometryUtilsType = NativeModules.GPRNGeometryUtils;

export const polygonContainsLocation =
  GPRNGeometryUtils.polygonContainsLocation;
export const circleContainsLocation = GPRNGeometryUtils.circleContainsLocation;
export const computeDistanceBetween = GPRNGeometryUtils.computeDistanceBetween;

export default GPRNGeometryUtils;
