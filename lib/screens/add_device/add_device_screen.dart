import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/screens/add_device/widgets/add_device_methods_item.dart';
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
                            width: width / 2 + 35.w,
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
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  final List<String> _list = [
    'Nearby Devices',
    'Add Manual',
  ];
}