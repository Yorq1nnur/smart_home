import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height / 1.9,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.urbanistW700.copyWith(
                fontSize: 28.w,
                color: AppColors.c212121,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subTitle,
              style: AppTextStyle.urbanistW400.copyWith(
                fontSize: 18.w,
                color: AppColors.c616161,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
