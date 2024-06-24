import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import '../../utils/app_colors.dart';

class TurnOnSetItem extends StatelessWidget {
  const TurnOnSetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12.h,
        bottom: 36.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.cFAFAFA,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.wifi),
          8.getW(),
          SvgPicture.asset(AppImages.bluetooth),
          8.getW(),
          Expanded(
            child: Text(
              "Ulanish uchun WiFi & Bluetoothni yoqing",
              style: AppTextStyle.urbanistW700.copyWith(
                fontSize: 16.w,
                color: AppColors.c616161,
              ),
            ),
          )
        ],
      ),
    );
  }
}
