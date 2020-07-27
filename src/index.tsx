import { NativeModules } from 'react-native';

export interface LatLng {
  latitude: number;
  longitude: number;
}

type GeometryUtilsType = {
  multiply(a: number, b: number): Promise<number>;
  containsLocation(point: LatLng, polygon: LatLng[]): Promise<boolean>;
};

const { GPRNGeometryUtils } = NativeModules;

export default GPRNGeometryUtils as GeometryUtilsType;
