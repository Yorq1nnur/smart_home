import 'package:flutter/material.dart';
import 'package:smart_home/utils/size.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.containerColors,
    required this.title,
    required this.onTap,
  });

  final Color containerColors;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: containerColors,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.cE0E0E0,
          width: containerColors != AppColors.c405FF2 ? 1.w : 0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 20.w,
          ),
          child: Text(
            title,
            style: AppTextStyle.urbanistW600.copyWith(
              fontSize: 16.w,
              color: containerColors == AppColors.c405FF2
                  ? Colors.white
                  : AppColors.c212121,
            ),
          ),
        ),
      ),
    );
  }
}
