import { NativeModules } from 'react-native';

type GeometryUtilsType = {
  multiply(a: number, b: number): Promise<number>;
};

const { GeometryUtils } = NativeModules;

export default GeometryUtils as GeometryUtilsType;
