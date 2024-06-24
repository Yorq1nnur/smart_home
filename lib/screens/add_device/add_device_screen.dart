import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/devices/devices_bloc.dart';
import 'package:smart_home/screens/add_device/widgets/add_device_methods_item.dart';
import 'package:smart_home/screens/add_device/widgets/device_category_item.dart';
import 'package:smart_home/screens/add_device/widgets/ripple_item.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  String method = 'Nearby Devices';
  int activeIndexCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Device',
          style: AppTextStyle.urbanistW700.copyWith(
            fontSize: 24.w,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 28.w,
            color: Colors.black,
          ),
        ),
        actions: [
          ZoomTapAnimation(
            child: SvgPicture.asset(
              AppImages.scanner,
            ),
          ),
          24.getW(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                _list.length,
                (index) => AddDeviceMethodsItem(
                  title: _list[index],
                  isSelected: method == _list[index],
                  onTap: () {
                    setState(() {
                      method = _list[index];
                    });
                    if (method == _list[1]) {
                      activeIndexCategory == 0
                          ? context.read<DevicesBloc>().add(
                                GetAllDevicesEvent(),
                              )
                          : context.read<DevicesBloc>().add(
                                GetCategoryDevicesEvent(
                                  _deviceCategories[activeIndexCategory],
                                ),
                              );
                    }
                  },
                ),
              ),
            ),
            36.getH(),
            method == _list[0]
                ? Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Looking for nearby devices...",
                            style: AppTextStyle.urbanistW700.copyWith(
                              fontSize: 24.w,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 12.h,
                              bottom: 36.h,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cFAFAFA,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImages.wifi),
                                8.getW(),
                                SvgPicture.asset(AppImages.bluetooth),
                                8.getW(),
                                Text(
                                  "Turn on your Wifi & Bluetooth to connect",
                                  style: AppTextStyle.urbanistW700.copyWith(
                                    fontSize: 16.w,
                                    color: AppColors.c616161,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const RippleItem(),
                          36.getH(),
                          Ink(
                            height: 58.h,
                            width: MediaQuery.of(context).size.width / 2 + 35.w,
                            decoration: BoxDecoration(
                              color: AppColors.c405FF2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Connect to All Devices",
                                  style: AppTextStyle.urbanistW700.copyWith(
                                    fontSize: 16.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          36.getH(),
                          Text(
                            "Can't find your devices?",
                            style: AppTextStyle.urbanistW400.copyWith(
                              fontSize: 16.w,
                              color: AppColors.c616161,
                            ),
                          ),
                          4.getH(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Learn more',
                              style: AppTextStyle.urbanistW500.copyWith(
                                fontSize: 14.w,
                                color: AppColors.c405FF2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 42.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(
                              _deviceCategories.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 0 : 6.w,
                                  right: index == _deviceCategories.length - 1
                                      ? 0
                                      : 6.w,
                                ),
                                child: DeviceCategoryItem(
                                  title: _deviceCategories[index],
                                  isSelected: activeIndexCategory == index,
                                  onTap: () {
                                    setState(() {
                                      activeIndexCategory = index;
                                    });
                                    activeIndexCategory == 0
                                        ? context.read<DevicesBloc>().add(
                                              GetAllDevicesEvent(),
                                            )
                                        : context.read<DevicesBloc>().add(
                                              GetCategoryDevicesEvent(
                                                _deviceCategories[index],
                                              ),
                                            );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        28.getH(),
                        BlocBuilder<DevicesBloc, DevicesState>(
                          builder: (context, state) {
                            return state.devices.isEmpty
                                ? const Center(child: Text('No devices found'))
                                : GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16.w,
                                    crossAxisSpacing: 16.h,
                                    children: List.generate(
                                      state.devices.length,
                                      (index) => ZoomTapAnimation(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: width / 2.35,
                                          height: height / 4.22,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  state.devices[index]
                                                      .deviceImage,
                                                ),
                                              ),
                                              12.getH(),
                                              Text(
                                                state.devices[index].deviceName,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  final List<String> _deviceCategories = [
    'Popular',
    'Lightning',
    'Camera',
    'Electrical',
  ];

  final List<String> _list = [
    'Nearby Devices',
    'Add Manual',
  ];
}
