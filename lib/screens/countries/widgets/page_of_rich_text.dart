import 'package:flutter/material.dart';
import 'package:smart_home/utils/size.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';

class PageOfRichText extends StatelessWidget {
  const PageOfRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
  });

  final String firstText;
  final String secondText;
  final String thirdText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: AppTextStyle.urbanistW700.copyWith(
          fontSize: 32.w,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 32.w,
              color: AppColors.c405FF2,
            ),
          ),
          TextSpan(
            text: thirdText,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 32.w,
            ),
          ),
        ],
      ),
    );
  }
}
