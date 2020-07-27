import GoogleMaps

@objc(GPRNGeometryUtils)
class GPRNGeometryUtils: NSObject {

  @objc(polygonContainsLocation:polygon:withResolver:withRejecter:)
  // Any may be String | double
  func polygonContainsLocation(
    point: [String:Any],
    polygon: [[String:Any]],
    resolve:RCTPromiseResolveBlock,
    reject:RCTPromiseRejectBlock
  ) -> Void {
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

    let isWithinCoverage = GMSGeometryContainsLocation(locationPoint, polygonPath as GMSPath, false)

    resolve(isWithinCoverage)
  }

  @objc(circleContainsLocation:circle:withResolver:withRejecter:)
  // Any may be String | double
  func circleContainsLocation(
    point: [String:Any],
    circle: [String:Any], r
    resolve:RCTPromiseResolveBlock,
    reject:RCTPromiseRejectBlock
  ) -> Void {
    let locationPoint = CLLocationCoordinate2DMake(
      CLLocationDegrees((point["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
      CLLocationDegrees((point["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
    )

    let centerDict = (circle["center"] as? NSDictionary) ?? [:]

    let circleCenter = CLLocationCoordinate2DMake(
      CLLocationDegrees((centerDict["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
      CLLocationDegrees((centerDict["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
    )
    let circleRadius = (circle["radius"] as? NSNumber)?.doubleValue ?? 0.0

    let distanceBetween = GMSGeometryDistance(locationPoint, circleCenter)

    resolve(circleRadius >= distanceBetween)
  }

  @objc(computeDistanceBetween:to:withResolver:withRejecter:)
  // Any may be String | double
  func computeDistanceBetween(
    from: [String:Any],
    to: [String:Any],
    resolve:RCTPromiseResolveBlock,
    reject:RCTPromiseRejectBlock
  ) -> Void {
    let locationPoint1 = CLLocationCoordinate2DMake(
      CLLocationDegrees((from["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
      CLLocationDegrees((from["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
    )

    let locationPoint2 = CLLocationCoordinate2DMake(
      CLLocationDegrees((to["latitude"] as? NSNumber)?.doubleValue ?? 0.0),
      CLLocationDegrees((to["longitude"] as? NSNumber)?.doubleValue ?? 0.0)
    )

    let distanceBetween = GMSGeometryDistance(locationPoint1, locationPoint2)

    resolve(distanceBetween)
  }
}
