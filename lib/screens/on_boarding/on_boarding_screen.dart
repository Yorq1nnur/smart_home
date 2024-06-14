import 'package:smart_home/data/local/storage_repository.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/on_boarding/widgets/bottom_part.dart';
import 'package:smart_home/screens/on_boarding/widgets/top_part.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeWidget = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.c405FF2,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            TopPart(
              imagePath: onBoardingData[activeWidget].imagePath,
            ),
            BottomPart(
              title: onBoardingData[activeWidget].title,
              subTitle: onBoardingData[activeWidget].subTitle,
            ),
            Positioned(
              bottom: 36.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          if (activeWidget != index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 10.h,
                              width: 10.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.cEEEEEE,
                              ),
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 10.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.c405FF2,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    activeWidget != 2
                        ? Row(
                            children: [
                              Ink(
                                height: 58.h,
                                width: 180.w,
                                decoration: BoxDecoration(
                                  color: AppColors.cF0F2FE,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () async {
                                    await StorageRepository.setBool(
                                            key: 'is_new_user', value: true)
                                        .then((v) {
                                      Navigator.pushReplacementNamed(
                                          context, RouteNames.welcomeScreen);
                                    });
                                  },
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
                              SizedBox(
                                width: 20.w,
                              ),
                              Ink(
                                height: 58.h,
                                width: 180.w,
                                decoration: BoxDecoration(
                                  color: AppColors.c405FF2,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    if (activeWidget != 2) {
                                      setState(() {
                                        activeWidget++;
                                      });
                                    }
                                  },
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
                        : GlobalButton(
                            onTap: () async {
                              await StorageRepository.setBool(
                                      key: 'is_new_user', value: true)
                                  .then((v) {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.welcomeScreen);
                              });
                            },
                            title: "Let's Get Started",
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
