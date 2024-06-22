import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/local/storage_repository.dart';
import '../routes/routes.dart';

class WellDoneScreen extends StatelessWidget {
  const WellDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
          ),
          child: ZoomTapAnimation(
            onTap: () async {
              await StorageRepository.setBool(
                key: 'is_auth',
                value: true,
              ).whenComplete(() {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.tabBoxScreen,
                  (route) => false,
                );
              });
            },
            child: SvgPicture.asset(
              AppImages.cancel,
              width: 28.w,
              height: 28.h,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.wellDone,
                  width: 120.w,
                  height: 120.h,
                ),
                32.getH(),
                Text(
                  'Well Done',
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 32.w,
                  ),
                ),
                12.getH(),
                Text(
                  "Congratulations! Your home is now a Smartify haven. Start exploring and managing your smart space with ease.",
                  style: AppTextStyle.urbanistW400.copyWith(
                    fontSize: 18.w,
                    color: AppColors.c616161,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 36.h,
            left: 24.w,
            right: 24.w,
            child: Ink(
              height: 58.h,
              width: width - 48.w,
              decoration: BoxDecoration(
                color: AppColors.c405FF2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () async {
                  await StorageRepository.setBool(
                    key: 'is_auth',
                    value: true,
                  ).whenComplete(() {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.tabBoxScreen,
                      (route) => false,
                    );
                  });
                },
                child: Center(
                  child: Text(
                    'Get Started',
                    style: AppTextStyle.urbanistW700.copyWith(
                      fontSize: 16.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
