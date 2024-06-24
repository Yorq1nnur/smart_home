import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/size.dart';

class RippleItem extends StatelessWidget {
  const RippleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 2.2,
      child: const Center(
        child: RippleAnimation(
          color: AppColors.c405FF2,
          delay: Duration(milliseconds: 500),
          repeat: true,
          minRadius: 100,
          ripplesCount: 3,
          duration: Duration(milliseconds: 3 * 500),
          child: CircleAvatar(
            minRadius: 100,
            maxRadius: 100,
            backgroundImage: AssetImage(
              AppImages.profile,
            ),
          ),
        ),
      ),
    );
  }
}
