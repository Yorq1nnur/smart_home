import 'package:flutter/material.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/size.dart';
import '../../../utils/app_text_style.dart';

class AddDeviceMethodsItem extends StatelessWidget {
  const AddDeviceMethodsItem({
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
      height: 42.h,
      width: width / 2 - 24,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.c405FF2 : AppColors.cF5F5F5,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 16.w,
              color: isSelected ? Colors.white : AppColors.c212121,
            ),
          ),
        ),
      ),
    );
  }
}
