import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/map/map_bloc.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/bloc/map/map_state.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<MapsBloc>().add(
            GetUserLocationEvent(),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Row(
            children: [
              Text(
                "My Home",
                style: AppTextStyle.urbanistW700.copyWith(
                  fontSize: 24.w,
                ),
              ),
              8.getW(),
              SvgPicture.asset(
                AppImages.arrowDown,
                width: 24.w,
                height: 24.h,
              ),
            ],
          ),
        ),
        actions: [
          ZoomTapAnimation(
            onTap: () {},
            child: SvgPicture.asset(
              AppImages.robot,
            ),
          ),
          20.getW(),
          ZoomTapAnimation(
            onTap: () {},
            child: SvgPicture.asset(
              AppImages.alarm,
            ),
          ),
          24.getW(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Container(
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
                              "20",
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
                        'Today Cloudy',
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
                                "78.2 %",
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
                                "2.0 m/s",
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
            ),
          ],
        ),
      ),
    );
  }
}
