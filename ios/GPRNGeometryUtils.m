#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(GPRNGeometryUtils, NSObject)

RCT_EXTERN_METHOD(
  multiply:(float)a
  withB:(float)b
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

RCT_EXTERN_METHOD(
  polygonContainsLocation:(NSDictionary *)point
  polygon:(NSArray *)polygon
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

RCT_EXTERN_METHOD(
  circleContainsLocation:(NSDictionary *)point
  circle:(NSDictionary *)circle
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

RCT_EXTERN_METHOD(
  computeDistanceBetween:(NSDictionary *)from
  to:(NSDictionary *)to
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

@end
