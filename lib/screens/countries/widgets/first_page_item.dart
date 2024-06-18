import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/utils/size.dart';
import 'package:smart_home/utils/utility_functions.dart';
import '../../../bloc/country/country_bloc.dart';
import '../../../data/models/country_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';

class FirstPageItem extends StatefulWidget {
  const FirstPageItem({super.key});

  @override
  State<FirstPageItem> createState() => _FirstPageItemState();
}

class _FirstPageItemState extends State<FirstPageItem> {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  String selectedCountry = '';

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
    _searchFocus.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.getH(),
        RichText(
          text: TextSpan(
            text: 'Select ',
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 32.w,
            ),
            children: [
              TextSpan(
                text: 'Country ',
                style: AppTextStyle.urbanistW700.copyWith(
                  fontSize: 32.w,
                  color: AppColors.c405FF2,
                ),
              ),
              TextSpan(
                text: 'Origin ',
                style: AppTextStyle.urbanistW700.copyWith(
                  fontSize: 32.w,
                ),
              ),
            ],
          ),
        ),
        8.getH(),
        Text(
          "Let's start by selecting the country where your smart haven resides.",
          style: AppTextStyle.urbanistW400.copyWith(
            fontSize: 18.w,
            color: AppColors.c616161,
          ),
          textAlign: TextAlign.center,
        ),
        28.getH(),
        BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            return TextField(
              controller: _searchController,
              onTap: () {
                setState(() {
                  _searchFocus.hasFocus
                      ? _searchFocus.unfocus()
                      : _searchFocus.requestFocus();
                });
              },
              onChanged: (v) async {
                await _searchMethod(
                  v,
                  state.allCountries,
                );
              },
              focusNode: _searchFocus,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 22.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.cFAFAFA,
                    width: 1.w,
                  ),
                ),
                hintText: 'Search Country',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                  ),
                  child: SvgPicture.asset(
                    AppImages.search,
                    height: 20.h,
                    width: 20.w,
                    colorFilter: ColorFilter.mode(
                      _searchFocus.hasFocus ? Colors.black : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                suffixIcon: Visibility(
                  visible: _searchFocus.hasFocus,
                  child: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      context.read<CountryBloc>().add(
                            GetCountriesEvent(),
                          );
                    },
                    icon: Icon(
                      Icons.clear,
                      size: 20.w,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
          if (state.formStatus == FormStatus.error) {
            return Center(
              child: Text(
                state.errorText,
              ),
            );
          }
          if (state.formStatus == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.formStatus == FormStatus.success) {
            return Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                  ),
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            setState(() {
                              selectedCountry = state.countries[index].name;
                            });
                            UtilityFunctions.methodPrint(
                              '${state.countries[index].name} on tapped',
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            height: 80.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.cFAFAFA,
                              border: Border.all(
                                width: 2.w,
                                color: state.countries[index].name ==
                                        selectedCountry
                                    ? AppColors.c405FF2
                                    : AppColors.cEEEEEE,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.countries[index].flag,
                                      style: TextStyle(
                                        fontSize: 60.w,
                                      ),
                                    ),
                                    16.getW(),
                                    Expanded(
                                      child: Text(
                                        state.countries[index].name,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppTextStyle.urbanistW600.copyWith(
                                          fontSize: 18.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: selectedCountry ==
                                      state.countries[index].name,
                                  child: SvgPicture.asset(
                                    AppImages.countryTick,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return const SizedBox.shrink();
        })
      ],
    );
  }

  Future<void> _searchMethod(String? v, List<CountryModel> countries) async {
    if (v == null || v.isEmpty) {
      context.read<CountryBloc>().add(
            GetCountriesEvent(),
          );
    } else {
      context.read<CountryBloc>().add(
            SearchCountriesEvent(
              query: v,
              searchedCountries: countries,
            ),
          );
    }
  }
}
