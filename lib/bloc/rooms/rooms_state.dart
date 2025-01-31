part of 'rooms_bloc.dart';

class RoomsState extends Equatable {
  final List<String> rooms;
  final List<String> roomImages;

  const RoomsState({
    required this.rooms,
    required this.roomImages,
  });

  RoomsState copyWith({
    List<String>? rooms,
    List<String>? roomImages,
  }) =>
      RoomsState(
        rooms: rooms ?? this.rooms,
        roomImages: roomImages ?? this.roomImages,
      );

  static RoomsState initial() => const RoomsState(
        rooms: [],
        roomImages: [],
      );

  @override
  List<Object?> get props => [
        rooms,
        roomImages,
      ];
}
