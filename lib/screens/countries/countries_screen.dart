import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/country/country_bloc.dart';
import 'package:smart_home/screens/countries/widgets/first_page_item.dart';
import 'package:smart_home/screens/countries/widgets/map_item.dart';
import 'package:smart_home/screens/countries/widgets/second_page_item.dart';
import 'package:smart_home/screens/countries/widgets/third_page_item.dart';
import 'package:smart_home/services/app_permissions.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:smart_home/utils/utility_functions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int activeIndex = 0;
  bool isLocationGranted = false;

  final PageController pageController = PageController();

  @override
  void initState() {
    Future.microtask(
      () => context.read<CountryBloc>().add(
            GetCountriesEvent(),
          ),
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28.w,
                    ),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: LinearProgressIndicator(
                      value: activeIndex == 3 ? 1 : (activeIndex + 1) / 4,
                      borderRadius: BorderRadius.circular(12),
                      minHeight: 12.h,
                      color: AppColors.c405FF2,
                      backgroundColor: AppColors.cEEEEEE,
                    ),
                  ),
                  Text(
                    activeIndex == 3 ? "4/4" : '${activeIndex + 1}/4',
                    style: AppTextStyle.urbanistW600.copyWith(
                      fontSize: 20.w,
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    FirstPageItem(),
                    SecondPageItem(),
                    ThirdPageItem(),
                    MapItem(),
                  ],
                ),
              ),
              15.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink(
                    height: 58.h,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.cF0F2FE,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (activeIndex == 3) {
                        } else {
                          setState(() {
                            activeIndex++;
                          });
                          pageController.jumpToPage(activeIndex);
                        }
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text(
                          'Skip',
                          style: AppTextStyle.urbanistW700.copyWith(
                            fontSize: 16.w,
                            color: AppColors.c405FF2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Ink(
                    height: 58.h,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.c405FF2,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (activeIndex == 2) {
                          UtilityFunctions.showLocationPermissionDialog(
                            context: context,
                            widget: Column(
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
                                    isLocationGranted = await AppPermissions
                                        .getLocationPermission();
                                    if (!context.mounted) return;
                                    Navigator.of(context).pop();
                                    UtilityFunctions.methodPrint(
                                        'LOCATIONS GRANTED: $isLocationGranted');
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
                                          style: AppTextStyle.urbanistW700
                                              .copyWith(
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
                                        style:
                                            AppTextStyle.urbanistW700.copyWith(
                                          fontSize: 16.w,
                                          color: AppColors.c405FF2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          setState(() {
                            activeIndex++;
                          });
                          pageController.jumpToPage(activeIndex);
                        }
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: AppTextStyle.urbanistW700.copyWith(
                            fontSize: 16.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
