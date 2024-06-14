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
    title: 'Continue with Google',
    imagePath: AppImages.google,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Continue with Apple',
    imagePath: AppImages.apple,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Continue with Facebook',
    imagePath: AppImages.facebook,
    onTap: () {},
  ),
  ButtonsData(
    title: 'Continue with Twitter',
    imagePath: AppImages.twitter,
    onTap: () {},
  ),
];
