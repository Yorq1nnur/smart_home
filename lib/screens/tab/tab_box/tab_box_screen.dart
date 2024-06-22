import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/tab_box/tab_box_bloc.dart';
import 'package:smart_home/screens/tab/account/account_screen.dart';
import 'package:smart_home/screens/tab/home/home_screen.dart';
import 'package:smart_home/screens/tab/reports/reports_screen.dart';
import 'package:smart_home/screens/tab/smart/smart_screen.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  List<Widget> _screens = [];

  @override
  void initState() {
    _screens = const [
      HomeScreen(),
      SmartScreen(),
      ReportsScreen(),
      AccountScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxBloc, TabBoxState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.activeIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.activeIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (v) {
              context.read<TabBoxBloc>().add(
                    ChangeActiveIndexEvent(
                      v,
                    ),
                  );
            },
            unselectedItemColor: AppColors.c9E9E9E,
            selectedItemColor: AppColors.c405FF2,
            selectedLabelStyle: AppTextStyle.urbanistW700.copyWith(
              fontSize: 10.w,
              color: AppColors.c405FF2,
            ),
            unselectedLabelStyle: AppTextStyle.urbanistW500.copyWith(
              fontSize: 10.w,
              color: AppColors.c9E9E9E,
            ),
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: SvgPicture.asset(
                  AppImages.unActiveHome,
                  width: 24.w,
                  height: 24.h,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.activeHome,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Smart',
                icon: SvgPicture.asset(
                  AppImages.unActiveSmart,
                  width: 24.w,
                  height: 24.h,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.activeSmart,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Reports',
                icon: SvgPicture.asset(
                  AppImages.unActiveReport,
                  width: 24.w,
                  height: 24.h,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.activeReport,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: SvgPicture.asset(
                  AppImages.unActiveAccount,
                  width: 24.w,
                  height: 24.h,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.activeAccount,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
