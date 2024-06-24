import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/bloc/my_home/my_home_bloc.dart';
import 'package:smart_home/data/models/my_home_model.dart';
import 'package:smart_home/screens/countries/widgets/page_of_rich_text.dart';
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
        const PageOfRichText(
          firstText: "O'z ",
          secondText: 'Davlatingizni ',
          thirdText: 'Tanlang',
        ),
        8.getH(),
        Text(
          "Keling, aqlli uyingiz joylashgan mamlakatni tanlashdan boshlaylik.",
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
                fillColor: AppColors.cFAFAFA,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.cFAFAFA,
                    width: 1.w,
                  ),
                ),
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
                hintText: 'Mamlakatni qidirish',
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
                      setState(() {
                        _searchFocus.unfocus();
                      });
                      if (_searchController.text.isNotEmpty) {
                        context.read<CountryBloc>().add(
                              GetCountriesEvent(),
                            );
                      }
                      _searchController.clear();
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
            UtilityFunctions.methodPrint(
              'DCDSCSDCSDCCSDCSDCS: ${state.countries.isEmpty}',
            );
            UtilityFunctions.methodPrint(
              'CURRENT COUNTRIES OF LENGTH IS: ${state.countries.length}',
            );
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
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
                            BlocProvider.of<MyHomeBloc>(context).add(
                              MakeMyHomeEvent(
                                MyHomeModelFields.country,
                                state.countries[index].name,
                              ),
                            );
                            BlocProvider.of<MyHomeBloc>(context).add(
                              MakeMyHomeEvent(
                                MyHomeModelFields.countryOfFlag,
                                state.countries[index].flag,
                              ),
                            );
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
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.countries[index].flag,
                                      style: TextStyle(
                                        fontSize: 60.w,
                                      ),
                                    ),
                                    16.getW(),
                                    SizedBox(
                                      width: width / 2,
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
