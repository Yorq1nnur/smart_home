import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/bloc/map/map_bloc.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../services/app_permissions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/utility_functions.dart';

class LocationPermissionWidget extends StatelessWidget {
  const LocationPermissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLocationGranted = false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80.w,
          width: 80.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.c405FF2,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.gps,
              width: 44.w,
              height: 44.h,
            ),
          ),
        ),
        32.getH(),
        Text(
          "Enable Location",
          style: AppTextStyle.urbanistW700.copyWith(
            fontSize: 24.w,
          ),
        ),
        16.getH(),
        Text(
          'Please activate the location feature, so we can find your home address.',
          style: AppTextStyle.urbanistW400.copyWith(
            fontSize: 16.w,
          ),
        ),
        32.getH(),
        ZoomTapAnimation(
          onTap: () async {
            isLocationGranted = await AppPermissions.getLocationPermission();
            if (!context.mounted) return;
            Navigator.of(context).pop();
            context.read<MapsBloc>().add(
                  CheckLocationPermissionStatusEvent(),
                );
            UtilityFunctions.methodPrint(
              'LOCATIONS GRANTED: $isLocationGranted',
            );
          },
          child: Container(
            height: 58.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.c405FF2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Center(
                child: Text(
                  'Enable Location',
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 16.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        12.getH(),
        ZoomTapAnimation(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 58.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cF0F2FE,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Not Now',
                style: AppTextStyle.urbanistW700.copyWith(
                  fontSize: 16.w,
                  color: AppColors.c405FF2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
