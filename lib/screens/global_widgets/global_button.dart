import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textColor,
  });

  final VoidCallback onTap;
  final String title;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 58.h,
      width: width - 48,
      decoration: BoxDecoration(
        color: color ?? AppColors.c405FF2,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 16.w,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
