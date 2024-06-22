import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/local/storage_repository.dart';

part 'rooms_event.dart';

part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsState.initial()) {
    on<AddRoomsEvent>(_addRooms);
    on<GetAllRoomsEvent>(_getRooms);
  }

  _getRooms(GetAllRoomsEvent event, emit) {
    List<String> rooms = StorageRepository.getStringList(key: 'my_rooms');
    emit(
      state.copyWith(
        rooms: rooms,
      ),
    );
  }

  _addRooms(AddRoomsEvent event, emit) {
    emit(
      state.copyWith(
        rooms: event.rooms,
      ),
    );
  }
}
