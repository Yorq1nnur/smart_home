import 'package:flutter/material.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/size.dart';
import '../../../utils/app_text_style.dart';

class DeviceCategoryItem extends StatelessWidget {
  const DeviceCategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.c405FF2 : AppColors.cE0E0E0,
          width: 1.w,
        ),
        color: isSelected ? AppColors.c405FF2 : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: Text(
            title,
            style: AppTextStyle.urbanistW600.copyWith(
              fontSize: 16.w,
              color: isSelected ? Colors.white : AppColors.c212121,
            ),
          ),
        ),
      ),
    );
  }
}
