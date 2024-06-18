import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/models/my_home_model.dart';
import 'package:smart_home/utils/utility_functions.dart';

part 'my_home_event.dart';

part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  MyHomeBloc()
      : super(
          MyHomeState.initial(),
        ) {
    on<MakeMyHomeEvent>(_makeMyHome);
  }

  _makeMyHome(MakeMyHomeEvent event, emit) {
    MyHomeModel myHomeModel = state.myHomeModel;
    switch (event.modelFields) {
      case MyHomeModelFields.country:
        myHomeModel = state.myHomeModel.copyWith(
          country: event.data,
        );
        UtilityFunctions.methodPrint(
          "UPDATED FIELD IS: ${event.modelFields.toString()}, UPDATED VALUE IS: ${event.data}",
        );
        break;
      case MyHomeModelFields.countryOfFlag:
        myHomeModel = state.myHomeModel.copyWith(
          countryOfFlag: event.data,
        );
        break;
      case MyHomeModelFields.homeName:
        myHomeModel = state.myHomeModel.copyWith(
          homeName: event.data,
        );
        break;
      case MyHomeModelFields.rooms:
        myHomeModel = state.myHomeModel.copyWith(
          rooms: event.data,
        );
        break;
      case MyHomeModelFields.addressModel:
        myHomeModel = state.myHomeModel.copyWith(
          addressModel: event.data,
        );
        break;
    }
    UtilityFunctions.methodPrint(
      'STATE OF MY HOME MODEL BEFORE UPGRADING: ${myHomeModel.toString()}',
    );
    emit(
      state.copyWith(
        myHomeModel: myHomeModel,
      ),
    );
    UtilityFunctions.methodPrint(
      "UPDATED MY HOME MODEL IS: ${state.myHomeModel.toString()}",
    );
  }
}
