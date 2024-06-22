part of 'rooms_bloc.dart';

class RoomsState extends Equatable {
  final List<String> rooms;

  const RoomsState({
    required this.rooms,
  });

  RoomsState copyWith({
    List<String>? rooms,
  }) =>
      RoomsState(
        rooms: rooms ?? this.rooms,
      );

  static RoomsState initial() => const RoomsState(
        rooms: [],
      );

  @override
  List<Object?> get props => [
        rooms,
      ];
}
