part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();
}

class SearchCountriesEvent extends CountryEvent {
  final String query;
  final List<CountryModel> searchedCountries;

  const SearchCountriesEvent({
    required this.query,
    required this.searchedCountries,
  });

  @override
  List<Object?> get props => [
        searchedCountries,
        query,
      ];
}

class GetCountriesEvent extends CountryEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
