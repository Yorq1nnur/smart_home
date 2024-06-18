import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static Future<bool> getLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    debugPrint("location STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.location.request();
      debugPrint("location STATUS AFTER ASK:$status");
      return false;
    } else  {
      return true;
    }
  }
}
