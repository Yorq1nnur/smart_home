import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/country/country_bloc.dart';
import 'package:smart_home/bloc/map/map_bloc.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/bloc/map/map_state.dart';
import 'package:smart_home/bloc/rooms/rooms_bloc.dart';
import 'package:smart_home/data/local/storage_repository.dart';
import 'package:smart_home/screens/countries/widgets/first_page_item.dart';
import 'package:smart_home/screens/countries/widgets/location_permission_widget.dart';
import 'package:smart_home/screens/countries/widgets/map_item.dart';
import 'package:smart_home/screens/countries/widgets/second_page_item.dart';
import 'package:smart_home/screens/countries/widgets/third_page_item.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import '../../utils/utility_functions.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int _activeIndex = 0;

  final PageController _pageController = PageController();

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
    _pageController.dispose();
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
                      value: _activeIndex == 3 ? 1 : (_activeIndex + 1) / 4,
                      borderRadius: BorderRadius.circular(12),
                      minHeight: 12.h,
                      color: AppColors.c405FF2,
                      backgroundColor: AppColors.cEEEEEE,
                    ),
                  ),
                  Text(
                    _activeIndex == 3 ? "4/4" : '${_activeIndex + 1}/4',
                    style: AppTextStyle.urbanistW600.copyWith(
                      fontSize: 20.w,
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
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
                        if (_activeIndex == 3) {
                        } else {
                          setState(() {
                            _activeIndex++;
                          });
                          _pageController.jumpToPage(_activeIndex);
                        }
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Center(
                        child: Text(
                          "O'tkazib yuborish",
                          style: AppTextStyle.urbanistW700.copyWith(
                            fontSize: 16.w,
                            color: AppColors.c405FF2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocListener<MapsBloc, MapsState>(
                    listener: (context, state) async {
                      if (state.isLocationGranted) {
                        context.read<MapsBloc>().add(
                              GetUserLocationEvent(),
                            );
                        context.read<MapsBloc>().add(
                              ChangeStatusInitialEvent(),
                            );
                        await Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _activeIndex = 3;
                          });
                          _pageController.jumpToPage(_activeIndex);
                        });
                      }
                    },
                    child: Ink(
                      height: 58.h,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.c405FF2,
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (_activeIndex == 2) {
                            await StorageRepository.setListString(
                              key: 'my_rooms',
                              values: context.read<RoomsBloc>().state.rooms,
                            ).whenComplete(() async {
                              await UtilityFunctions
                                  .showLocationPermissionDialog(
                                context: context,
                                widget: const LocationPermissionWidget(),
                              );
                            });
                          } else if (_activeIndex != 3) {
                            setState(() {
                              _activeIndex++;
                            });
                            _pageController.jumpToPage(_activeIndex);
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteNames.wellDoneScreen,
                              (predicate) => false,
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Center(
                          child: Text(
                            'Davom etish',
                            style: AppTextStyle.urbanistW700.copyWith(
                              fontSize: 16.w,
                              color: Colors.white,
                            ),
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
