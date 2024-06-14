import 'package:flutter/material.dart';
import 'package:smart_home/screens/countries/widgets/first_page_item.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int activeIndex = 0;

  final FocusNode _searchFocus = FocusNode();

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
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
                  children: const [
                    FirstPageItem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
