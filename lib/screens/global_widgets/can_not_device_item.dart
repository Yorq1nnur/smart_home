import 'package:flutter/material.dart';
import 'package:smart_home/utils/size.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class CanNotDeviceItem extends StatelessWidget {
  const CanNotDeviceItem({
    super.key,
    required this.onCanNotTap,
    required this.onMoreInfoTap,
    required this.canNotTitle,
    required this.moreInfoTitle,
  });

  final VoidCallback onCanNotTap;
  final VoidCallback onMoreInfoTap;
  final String canNotTitle;
  final String moreInfoTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onCanNotTap,
          child: Text(
            canNotTitle,
            style: AppTextStyle.urbanistW400.copyWith(
              fontSize: 16.w,
              color: AppColors.c616161,
            ),
          ),
        ),
        TextButton(
          onPressed: onMoreInfoTap,
          child: Text(
           moreInfoTitle,
            style: AppTextStyle.urbanistW500.copyWith(
              fontSize: 14.w,
              color: AppColors.c405FF2,
            ),
          ),
        ),
      ],
    );
  }
}
