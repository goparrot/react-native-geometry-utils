#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(GPRNGeometryUtils, NSObject)

RCT_EXTERN_METHOD(
  multiply:(float)a
  withB:(float)b
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

RCT_EXTERN_METHOD(
  containsLocation:(NSDictionary *)point
  polygon:(NSArray *)polygon
  withResolver:(RCTPromiseResolveBlock)resolve
  withRejecter:(RCTPromiseRejectBlock)reject
)

@end
