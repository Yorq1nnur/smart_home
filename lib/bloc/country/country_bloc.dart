import 'package:equatable/equatable.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/data/models/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/network/network_response.dart';
import 'package:smart_home/data/repositories/country_repository.dart';
import 'package:smart_home/utils/utility_functions.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(this.countryRepository) : super(CountryState.initial()) {
    on<GetCountriesEvent>(_getCountries);
    on<SearchCountriesEvent>(_searchCountries);
  }

  final CountryRepository countryRepository;

  _getCountries(GetCountriesEvent event, emit) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    NetworkResponse networkResponse = await countryRepository.getCountries();

    if (networkResponse.errorText.isEmpty) {
      List<CountryModel> countries = networkResponse.data;
      UtilityFunctions.methodPrint(
        'GET COUNTRIES OF LENGTH IS: ${countries.length}',
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          countries: countries,
          allCountries: countries,
        ),
      );
    } else {
      UtilityFunctions.methodPrint(
        'GET CATEGORIES OF ERROR IS: ${networkResponse.errorText}',
      );
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  _searchCountries(SearchCountriesEvent event, emit) {
    emit(
      state.copyWith(
        countries: event.searchedCountries
            .where(
              (e) => e.name.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }
}
