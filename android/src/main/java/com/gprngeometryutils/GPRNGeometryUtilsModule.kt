package com.gprngeometryutils

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise

import com.google.maps.android.PolyUtil;
import com.google.maps.android.SphericalUtil;
import com.google.android.gms.maps.model.LatLng;

class GPRNGeometryUtilsModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "GPRNGeometryUtils"
  }

  @ReactMethod
  fun polygonContainsLocation(point: ReadableMap, polygon: ReadableArray, promise: Promise) {
    val locationPoint = LatLng(
      point?.getDouble("latitude") ?: 0.0,
      point?.getDouble("longitude") ?: 0.0
    )

    val polygonList = arrayListOf<LatLng>()
    val size = polygon.size()

    repeat(size) { i ->
      val vertex = polygon.getMap(i)
      polygonList.add(
        LatLng(
          vertex?.getDouble("latitude") ?: 0.0,
          vertex?.getDouble("longitude") ?: 0.0
        )
      )
    }

    val isWithinCoverage = PolyUtil.containsLocation(locationPoint, polygonList, false)

    promise.resolve(isWithinCoverage)
  }

  @ReactMethod
  fun circleContainsLocation(point: ReadableMap, circle: ReadableMap, promise: Promise) {
    val locationPoint = LatLng(
      point?.getDouble("latitude") ?: 0.0,
      point?.getDouble("longitude") ?: 0.0
    )

    val circleCenter = if (circle?.hasKey("center")) LatLng(
      circle?.getMap("center")?.getDouble("latitude") ?: 0.0,
      circle?.getMap("center")?.getDouble("longitude") ?: 0.0
    ) else LatLng(0.0, 0.0)
    val circleRadius = circle?.getDouble("radius") ?: 0.0

    val distanceBetween = SphericalUtil.computeDistanceBetween(locationPoint, circleCenter)

    promise.resolve(circleRadius >= distanceBetween)
  }

  @ReactMethod
  fun computeDistanceBetween(from: ReadableMap, to: ReadableMap, promise: Promise) {
    val locationPoint1 = LatLng(
      from?.getDouble("latitude") ?: 0.0,
      from?.getDouble("longitude") ?: 0.0
    )

    val locationPoint2 = LatLng(
      to?.getDouble("latitude") ?: 0.0,
      to?.getDouble("longitude") ?: 0.0
    )

    val distanceBetween = SphericalUtil.computeDistanceBetween(locationPoint1, locationPoint2)

    promise.resolve(distanceBetween)
  }
}
