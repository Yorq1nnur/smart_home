import '../../utils/app_images.dart';

class RoomModel {
  final String roomName;
  final String roomImage;

  RoomModel({
    required this.roomImage,
    required this.roomName,
  });

  @override
  String toString() {
    return 'RoomModel{'
        ' roomName: $roomName,'
        ' roomImage: $roomImage'
        '}';
  }
}

final List<RoomModel> myRooms = [
  RoomModel(
    roomImage: AppImages.livingRoom,
    roomName: 'Mehmonxona',
  ),
  RoomModel(
    roomImage: AppImages.badRoom,
    roomName: 'Yotoqxona',
  ),
  RoomModel(
    roomImage: AppImages.bathroom,
    roomName: 'Hammom',
  ),
  RoomModel(
    roomImage: AppImages.kitchen,
    roomName: 'Oshxona',
  ),
  RoomModel(
    roomImage: AppImages.studyRoom,
    roomName: "O'quv xonasi",
  ),
  RoomModel(
    roomImage: AppImages.diningRoom,
    roomName: 'Ovqatlanish xonasi',
  ),
  RoomModel(
    roomImage: AppImages.backyard,
    roomName: 'Orqa hovli',
  ),
  RoomModel(
    roomImage: AppImages.addNewRoom,
    roomName: "Xona Qo'shish",
  ),
];
