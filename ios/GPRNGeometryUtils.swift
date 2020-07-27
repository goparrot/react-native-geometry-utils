import GoogleMaps

@objc(GPRNGeometryUtils)
class GPRNGeometryUtils: NSObject {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }

  @objc(containsLocation:polygon:withResolver:withRejecter:)
  // Any = String | double
  func containsLocation(point: [String:Any], polygon: [[String:Any]], resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    let locationPoint = CLLocationCoordinate2DMake(
      CLLocationDegrees((point["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
      CLLocationDegrees((point["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
    )

    let polygonPath = GMSMutablePath()

    for path in polygon {
      polygonPath.add(
        CLLocationCoordinate2DMake(
          CLLocationDegrees((path["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
          CLLocationDegrees((path["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
        )
      )
    }

    if GMSGeometryContainsLocation(locationPoint, polygonPath as GMSPath, false) {
      resolve(true)
    } else {
      resolve(false)
    }

    // let loc1 = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
    // let loc2 = CLLocationCoordinate2D(latitude: -31.86, longitude: 150.20)
    // let result = GMSGeometryDistance(loc1, loc2)


    // resolve(result)
  }
}
