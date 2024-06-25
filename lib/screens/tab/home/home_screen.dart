import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/devices/devices_bloc.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/bloc/rooms/rooms_bloc.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/screens/tab/home/widgets/room_item.dart';
import 'package:smart_home/screens/tab/home/widgets/weather_widget.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndex = -1;

  @override
  void initState() {
    Future.microtask(
      () => context.read<DevicesBloc>().add(
            GetAllDevicesFromDbEvent(),
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
                "Mening Uyim",
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
            const WeatherWidget(
              gradus: '20',
              humidity: '78.2',
              speed: "2.0",
            ),
            20.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Barcha qurilmalar",
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 20.w,
                  ),
                ),
                ZoomTapAnimation(
                  child: Icon(
                    Icons.more_vert,
                    size: 24.w,
                  ),
                ),
              ],
            ),
            16.getH(),
            BlocBuilder<RoomsBloc, RoomsState>(
              builder: (context, state) {
                if (state.rooms.isNotEmpty) {
                  return SizedBox(
                    height: 45.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 6.w,
                          ),
                          child: RoomItem(
                            containerColors: _activeIndex == -1
                                ? AppColors.c405FF2
                                : Colors.white,
                            title: 'Barcha xonalar',
                            onTap: () {
                              setState(() {
                                _activeIndex = -1;
                              });
                            },
                          ),
                        ),
                        ...List.generate(
                          state.rooms.length,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                              ),
                              child: RoomItem(
                                containerColors: _activeIndex == index
                                    ? AppColors.c405FF2
                                    : Colors.white,
                                title: state.rooms[index],
                                onTap: () {
                                  setState(() {
                                    _activeIndex = index;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 42.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        RoomItem(
                          containerColors: _activeIndex == -1
                              ? AppColors.c405FF2
                              : Colors.white,
                          title: 'Barcha xonalar',
                          onTap: () {
                            setState(() {
                              _activeIndex = -1;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            47.getH(),
            BlocBuilder<DevicesBloc, DevicesState>(
              builder: (context, state) {
                if (state.formStatus == FormStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.formStatus == FormStatus.error) {
                  return Center(
                    child: Text(state.errorText),
                  );
                }
                if (state.formStatus == FormStatus.success) {
                  if (state.devices.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppImages.noDevices,
                            width: 120.w,
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),
                          24.getH(),
                          Text(
                            "Qurilmalar yo'q",
                            style: AppTextStyle.urbanistW700.copyWith(
                              fontSize: 20.w,
                            ),
                          ),
                          8.getH(),
                          Text(
                            "Siz hali qurilma qo‘shmagansiz.",
                            style: AppTextStyle.urbanistW400.copyWith(
                              fontSize: 16.w,
                              color: AppColors.c616161,
                            ),
                          ),
                          24.getH(),
                          Ink(
                            // height: 50.h,
                            // width: 160.w,
                            decoration: BoxDecoration(
                              color: AppColors.c405FF2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.addDeviceScreen,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 16.w,
                                      color: Colors.white,
                                    ),
                                    16.getW(),
                                    Text(
                                      "Qurilma qo'shish",
                                      style: AppTextStyle.urbanistW700.copyWith(
                                        fontSize: 14.w,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: state.devices.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemBuilder: (context, index) {
                          return Image.asset(
                            state.devices[index].deviceImage,
                          );
                        },
                      ),
                    );
                  }
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: 16.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomTapAnimation(
              child: SvgPicture.asset(
                AppImages.microphone,
                width: 28.w,
                height: 28.h,
              ),
            ),
            34.getW(),
            ZoomTapAnimation(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.addDeviceScreen,
                );
              },
              child: Ink(
                height: 60.h,
                width: 60.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.c405FF2,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 28.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
