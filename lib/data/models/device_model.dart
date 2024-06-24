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
    deviceCategoryName: 'Lightning',
    deviceImage: AppImages.lamp,
    deviceName: 'Smart Lamp',
  ),
  DeviceModel(
    deviceCategoryName: 'Camera',
    deviceImage: AppImages.cam,
    deviceName: 'Smart V1 CCTV',
  ),
  DeviceModel(
    deviceCategoryName: 'Camera',
    deviceImage: AppImages.webCam,
    deviceName: 'Smart Webcam',
  ),
  DeviceModel(
    deviceCategoryName: 'Camera',
    deviceImage: AppImages.camera,
    deviceName: 'Smart V2 CCTV',
  ),
  DeviceModel(
    deviceCategoryName: 'Electrical',
    deviceImage: AppImages.musicPlayer,
    deviceName: 'Music Player',
  ),
  DeviceModel(
    deviceCategoryName: 'Electrical',
    deviceImage: AppImages.router,
    deviceName: 'Smart Router',
  ),
];
