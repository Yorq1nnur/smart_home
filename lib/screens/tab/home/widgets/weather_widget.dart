import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/size.dart';
import '../../../../bloc/map/map_bloc.dart';
import '../../../../bloc/map/map_state.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_text_style.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.gradus,
    required this.humidity,
    required this.speed,
  });

  final String gradus;
  final String humidity;
  final String speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 17.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.c405FF2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 80.w,
                height: 45.h,
                child: Stack(
                  children: [
                    Text(
                      gradus,
                      style: AppTextStyle.urbanistW900.copyWith(
                        fontSize: 40.w,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset(AppImages.gradus),
                    ),
                  ],
                ),
              ),
              12.getH(),
              BlocBuilder<MapsBloc, MapsState>(
                builder: (context, state) {
                  return SizedBox(
                    width: 150.w,
                    child: Text(
                      state.addressName,
                      style: AppTextStyle.urbanistW500.copyWith(
                        fontSize: 12.w,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              5.getH(),
              Text(
                'Bugun bulutli',
                style: AppTextStyle.urbanistW500.copyWith(
                  fontSize: 12.w,
                  color: Colors.white,
                ),
              ),
              12.getH(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppImages.plant,
                      ),
                      5.getW(),
                      Text(
                        "AQI 92",
                        style: AppTextStyle.urbanistW400.copyWith(
                          fontSize: 10.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppImages.humidity,
                      ),
                      5.getW(),
                      Text(
                        "$humidity %",
                        style: AppTextStyle.urbanistW400.copyWith(
                          fontSize: 10.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppImages.speed,
                      ),
                      5.getW(),
                      Text(
                        "$speed m/s",
                        style: AppTextStyle.urbanistW400.copyWith(
                          fontSize: 10.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Image.asset(
            AppImages.weather,
            width: 160.w,
            height: 105.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
