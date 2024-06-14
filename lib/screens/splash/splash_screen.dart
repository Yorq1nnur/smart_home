import 'package:smart_home/data/local/storage_repository.dart';
import 'package:smart_home/screens/on_boarding/on_boarding_screen.dart';
import 'package:smart_home/screens/welcome/welcome_screen.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    bool isNewUser = StorageRepository.getBool(key: "is_new_user");
    Future.delayed(const Duration(seconds: 3), () {
      !isNewUser
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoardingScreen(),
              ),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 240.h),
          Center(
            child: Image.asset(
              AppImages.smartTify,
              height: 160.h,
              width: 160.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            'Smartify',
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 40.w,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 75.w,
            width: 75.w,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
