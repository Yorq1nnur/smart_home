import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/tab_box/tab_box_bloc.dart';
import 'package:smart_home/screens/tab/account/account_screen.dart';
import 'package:smart_home/screens/tab/home/home_screen.dart';
import 'package:smart_home/screens/tab/reports/reports_screen.dart';
import 'package:smart_home/screens/tab/smart/smart_screen.dart';
import 'package:smart_home/utils/app_images.dart';

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
    return Scaffold(
      body: BlocBuilder<TabBoxBloc, TabBoxState>(builder: (context, state) {
        return _screens[state.activeIndex];
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.unActiveHome,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.activeHome,
            ),
          ),
        ],
      ),
    );
  }
}