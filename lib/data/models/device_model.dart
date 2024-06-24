import 'package:smart_home/utils/app_images.dart';

class DeviceModel {
  final String deviceName;
  final String deviceCategoryName;
  final String deviceImage;

  DeviceModel({
    required this.deviceCategoryName,
    required this.deviceImage,
    required this.deviceName,
  });
}

final List<DeviceModel> activeDevices = [
  DeviceModel(
    deviceCategoryName: 'Chaqmoq',
    deviceImage: AppImages.lamp,
    deviceName: 'Smart Lamp',
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.cam,
    deviceName: 'Smart V1 CCTV',
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.webCam,
    deviceName: 'Smart Webcam',
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.camera,
    deviceName: 'Smart V2 CCTV',
  ),
  DeviceModel(
    deviceCategoryName: 'Kamera',
    deviceImage: AppImages.musicPlayer,
    deviceName: 'Music Player',
  ),
  DeviceModel(
    deviceCategoryName: 'Elektr',
    deviceImage: AppImages.router,
    deviceName: 'Smart Router',
  ),
];
