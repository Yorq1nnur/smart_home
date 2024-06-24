import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/local/storage_repository.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import '../../bloc/map/map_bloc.dart';
import '../../bloc/map/map_event.dart';
import '../../bloc/rooms/rooms_bloc.dart';

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
    bool isAuth = StorageRepository.getBool(
      key: "is_auth",
    );
    bool isNewUser = StorageRepository.getBool(
      key: "is_new_user",
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (isAuth) {
        context.read<MapsBloc>().add(
              GetUserLocationEvent(),
            );
        context.read<RoomsBloc>().add(
              GetAllRoomsEvent(),
            );
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.tabBoxScreen,
          (route) => false,
        );
      } else {
        !isNewUser
            ? Navigator.pushReplacementNamed(
                context,
                RouteNames.onBoardingScreen,
              )
            : Navigator.pushReplacementNamed(
                context,
                RouteNames.welcomeScreen,
              );
      }
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
