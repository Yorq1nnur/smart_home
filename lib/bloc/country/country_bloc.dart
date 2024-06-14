import 'package:equatable/equatable.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/data/models/country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/repositories/country_repository.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(this.countryRepository) : super(CountryState.initial()) {
    on<CountryEvent>((event, emit) {});
  }

  final CountryRepository countryRepository;
}
