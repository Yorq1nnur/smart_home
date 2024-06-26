import 'package:smart_home/utils/app_images.dart';

class DeviceModel {
  final String deviceName;
  final String deviceCategoryName;
  final String deviceImage;
  final int isActiveDevice;
  final String roomName;
  final int id;

  DeviceModel({
    required this.deviceCategoryName,
    required this.deviceImage,
    required this.deviceName,
    required this.isActiveDevice,
    required this.roomName,
    required this.id,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceName: json['deviceName'] as String? ?? '',
      deviceCategoryName: json['deviceCategoryName'] as String? ?? '',
      deviceImage: json['deviceImage'] as String? ?? '',
      roomName: json['roomName'] as String? ?? '',
      isActiveDevice: json['isActiveDevice'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceName': deviceName,
      'deviceCategoryName': deviceCategoryName,
      'deviceImage': deviceImage,
      'roomName': roomName,
      'isActiveDevice': isActiveDevice,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'isActiveDevice': isActiveDevice,
    };
  }

  static DeviceModel initial() => DeviceModel(
        deviceCategoryName: '',
        deviceImage: 'deviceImage',
        deviceName: 'deviceName',
        isActiveDevice: 1,
        roomName: 'roomName',
        id: 0,
      );

  DeviceModel copyWith({
    String? deviceName,
    String? deviceCategoryName,
    String? deviceImage,
    int? isActiveDevice,
    String? roomName,
    int? id,
  }) =>
      DeviceModel(
        deviceCategoryName: deviceCategoryName ?? this.deviceCategoryName,
        deviceImage: deviceImage ?? this.deviceImage,
        deviceName: deviceName ?? this.deviceName,
        isActiveDevice: isActiveDevice ?? this.isActiveDevice,
        roomName: roomName ?? this.roomName,
        id: id ?? this.id,
      );

  @override
  String toString() {
    return 'DeviceModel(deviceName: $deviceName, deviceCategoryName: $deviceCategoryName, deviceImage: $deviceImage, isActiveDevice: $isActiveDevice, roomName: $roomName, id: $id)';
  }
}

final List<DeviceModel> activeDevices = [
  DeviceModel(
    deviceCategoryName: 'Chaqmoq',
    deviceImage: AppImages.lamp,
    deviceName: 'Smart Lamp',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.cam,
    deviceName: 'Smart V1 CCTV',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.webCam,
    deviceName: 'Smart Webcam',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.camera,
    deviceName: 'Smart V2 CCTV',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
  DeviceModel(
    deviceCategoryName: 'Elektr',
    deviceImage: AppImages.musicPlayer,
    deviceName: 'Music Player',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
  DeviceModel(
    deviceCategoryName: 'Elektr',
    deviceImage: AppImages.router,
    deviceName: 'Smart Router',
    isActiveDevice: 1,
    roomName: '',
    id: 0,
  ),
];
