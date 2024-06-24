import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/screens/welcome/data/buttons_data.dart';
import 'package:smart_home/screens/welcome/widgets/continue_button.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 36.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.letsSmartTify,
                      height: 80.h,
                      width: 80.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Qani boshladik!!!",
                    style: AppTextStyle.urbanistW700.copyWith(
                      fontSize: 32.w,
                      color: AppColors.c212121,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Keling, hisobingizga kiraylik",
                    style: AppTextStyle.urbanistW400.copyWith(
                      fontSize: 18.w,
                      color: AppColors.c616161,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ...List.generate(
                    buttonsData.length,
                    (index) => ContinueButton(
                      imagePath: buttonsData[index].imagePath,
                      title: buttonsData[index].title,
                      onTap: buttonsData[index].onTap,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GlobalButton(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.signUpScreen);
                    },
                    title: "Ro'yxatdan o'tish",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GlobalButton(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.signInScreen);
                    },
                    title: "Tizimga kirish",
                    color: AppColors.cF0F2FE,
                    textColor: AppColors.c405FF2,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Maxfiylik siyosati',
                          style: AppTextStyle.urbanistW400.copyWith(
                            fontSize: 14.w,
                            color: AppColors.c616161,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Xizmat ko'rsatish shartlari",
                          style: AppTextStyle.urbanistW400.copyWith(
                            fontSize: 14.w,
                            color: AppColors.c616161,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
