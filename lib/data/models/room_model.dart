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
