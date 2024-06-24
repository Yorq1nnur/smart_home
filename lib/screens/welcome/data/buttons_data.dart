import 'dart:ui';
import 'package:smart_home/utils/app_images.dart';

class ButtonsData {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  ButtonsData({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });
}

List<ButtonsData> buttonsData = [
  ButtonsData(
    title: 'Google bilan davom etish',
    imagePath: AppImages.google,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Apple bilan davom etish',
    imagePath: AppImages.apple,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Facebook bilan davom etish',
    imagePath: AppImages.facebook,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Twitter bilan davom etish',
    imagePath: AppImages.twitter,
    onTap: () {},
  ),
];
