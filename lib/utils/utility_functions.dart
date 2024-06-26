import 'package:flutter/material.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';

import 'app_images.dart';

class UtilityFunctions {
  static void methodPrint(dynamic data) {
    debugPrint("\$\$\$\$\$\n$data\n\$\$\$\$\$");
  }

  static Future<List<String>> getRoomImages(
      {required List<String> rooms}) async {
    List<String> roomImages = [];
    for (int i = 0; i < rooms.length; i++) {
      if (rooms[i] == 'Mehmonxona') {
        roomImages.add(AppImages.livingRoom);
      }
      if (rooms[i] == 'Yotoqxona') {
        roomImages.add(AppImages.badRoom);
      }
      if (rooms[i] == 'Hammom') {
        roomImages.add(AppImages.bathroom);
      }
      if (rooms[i] == 'Oshxona') {
        roomImages.add(AppImages.kitchen);
      }
      if (rooms[i] == 'Ovqatlanish xonasi') {
        roomImages.add(AppImages.diningRoom);
      }
      if (rooms[i] == "O'quv xonasi") {
        roomImages.add(AppImages.studyRoom);
      }
      if (rooms[i] == 'Orqa hovli') {
        roomImages.add(AppImages.backyard);
      }
    }
    return roomImages;
  }

  static void showAuthDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: width - 100,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80.w,
                    width: 80.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 10.w,
                    ),
                  ),
                  24.getH(),
                  Text(
                    message,
                    style: AppTextStyle.urbanistW600.copyWith(
                      fontSize: 20.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyle.urbanistW900,
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor ?? Colors.blue,
      ),
    );
  }

  static Future<void> showLocationPermissionDialog({
    required BuildContext context,
    required Widget widget,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: width - 100,
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 32.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: widget,
              ),
            ),
          );
        });
  }
}
