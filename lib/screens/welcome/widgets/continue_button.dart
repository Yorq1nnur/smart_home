import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Ink(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColors.cEEEEEE,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(
                  width: 75.w,
                ),
                Text(
                  title,
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 16.w,
                    color: AppColors.c212121,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
