part of 'country_bloc.dart';

class CountryState extends Equatable {
  final FormStatus formStatus;
  final String errorText;
  final List<CountryModel> countries;
  final List<CountryModel> allCountries;

  const CountryState({
    required this.formStatus,
    required this.countries,
    required this.errorText,
    required this.allCountries,
  });

  static CountryState initial() => const CountryState(
        formStatus: FormStatus.pure,
        countries: [],
        allCountries: [],
        errorText: '',
      );

  CountryState copyWith({
    FormStatus? formStatus,
    String? errorText,
    List<CountryModel>? countries,
    List<CountryModel>? allCountries,
  }) =>
      CountryState(
        formStatus: formStatus ?? this.formStatus,
        countries: countries ?? this.countries,
        errorText: errorText ?? this.errorText,
        allCountries: allCountries ?? this.allCountries,
      );

  @override
  List<Object?> get props => [
        errorText,
        formStatus,
        countries,
        allCountries,
      ];
}
