import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rooms_event.dart';

part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsState.initial()) {
    on<AddRoomsEvent>(_addRooms);
  }

  _addRooms(AddRoomsEvent event, emit) {
    emit(
      state.copyWith(
        rooms: event.rooms,
      ),
    );
  }
}
