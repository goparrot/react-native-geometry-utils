import { NativeModules } from 'react-native';

type GeometryUtilsType = {
  multiply(a: number, b: number): Promise<number>;
};

const { GPRNGeometryUtils } = NativeModules;

export default GPRNGeometryUtils as GeometryUtilsType;
