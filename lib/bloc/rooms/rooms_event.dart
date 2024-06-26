part of 'rooms_bloc.dart';

sealed class RoomsEvent extends Equatable {
  const RoomsEvent();
}

class AddRoomsEvent extends RoomsEvent {
  final List<String> rooms;

  const AddRoomsEvent(
    this.rooms,
  );

  @override
  List<Object?> get props => [
        rooms,
      ];
}

class GetAllRoomsEvent extends RoomsEvent {
  @override
  List<Object?> get props => [];
}
