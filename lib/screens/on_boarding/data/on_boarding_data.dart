import '../../../utils/app_images.dart';

class OnBoardingData {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingData({
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
}

final List<OnBoardingData> onBoardingData = [
  OnBoardingData(
    title: 'Empower Your Home,\nSimplify Your Life',
    subTitle:
        """Transform your living space into a smarter, more connected home with Smartify.
All at your fingertips.""",
    imagePath: AppImages.firstOnBoarding,
  ),
  OnBoardingData(
    title: 'Effortless Control,\nAutomate, & Secure',
    subTitle:
        """Smartify empowers you to control your devices, & automate your routines. Embrace a world where your home adapts to your needs""",
    imagePath: AppImages.secondOnBoarding,
  ),
  OnBoardingData(
    title: 'Efficiency that Saves, Comfort that Lasts.',
    subTitle:
        """Take control of your home's energy usage, set preferences, and enjoy a space that adapts to your needs while saving power.""",
    imagePath: AppImages.thirdOnBoarding,
  ),
];
