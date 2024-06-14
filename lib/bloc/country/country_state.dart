part of 'country_bloc.dart';

class CountryState extends Equatable {
  final FormStatus formStatus;
  final String errorText;
  final List<CountryModel> countries;

  const CountryState({
    required this.formStatus,
    required this.countries,
    required this.errorText,
  });

  static CountryState initial() => const CountryState(
        formStatus: FormStatus.pure,
        countries: [],
        errorText: '',
      );

  @override
  List<Object?> get props => [
        errorText,
        formStatus,
        countries,
      ];
}
