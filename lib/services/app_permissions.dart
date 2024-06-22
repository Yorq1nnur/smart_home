import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static Future<bool> getLocationPermission() async {
    PermissionStatus status = await Permission.locationAlways.status;
    debugPrint("location STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.locationAlways.request();
      debugPrint("location STATUS AFTER ASK:$status");
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> checkLocationPermission() async {
    PermissionStatus status = await Permission.locationAlways.status;
    debugPrint("location STATUS:$status");
    if (status.isDenied) {
      debugPrint("location STATUS AFTER ASK:$status");
      return false;
    } else {
      return true;
    }
  }
}
