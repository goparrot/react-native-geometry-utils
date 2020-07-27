package com.gprngeometryutils

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise

import com.google.maps.android.PolyUtil;
import com.google.android.gms.maps.model.LatLng;

class GPRNGeometryUtilsModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "GPRNGeometryUtils"
  }

  // Example method
  // See https://facebook.github.io/react-native/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Int, b: Int, promise: Promise) {
    promise.resolve(a * b)
  }

  // Example method
  // See https://facebook.github.io/react-native/docs/native-modules-android
  @ReactMethod
  fun containsLocation(
    point: ReadableMap,
    polygon: ReadableArray,
    promise: Promise
  ) {
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
          vertex?.getDouble("latitude") ?: 0.0
        )
      )
    }

    val isWithinCoverage = PolyUtil.containsLocation(locationPoint, polygonList, false)

    promise.resolve(isWithinCoverage)
  }
}
