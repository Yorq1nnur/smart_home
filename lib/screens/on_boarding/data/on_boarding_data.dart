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
    title: 'Uyingizga kuch bering,\nHayotingizni soddalashtiring',
    subTitle:
        """Smartify bilan yashash joyingizni yanada aqlliroq va aloqador uyga aylantiring.
Hammasi sizning qo'lingizda.""",
    imagePath: AppImages.firstOnBoarding,
  ),
  OnBoardingData(
    title: 'Qiyinchiliksiz nazorat,\nAvtomatlashtirish va xavfsiz',
    subTitle:
        """Smartify sizga qurilmalaringizni boshqarish va tartiblaringizni avtomatlashtirish imkonini beradi. Uyingiz ehtiyojlaringizga mos keladigan dunyoni qabul qiling""",
    imagePath: AppImages.secondOnBoarding,
  ),
  OnBoardingData(
    title: 'Tejaydigan samaradorlik, uzoq davom etadigan qulaylik.',
    subTitle:
        """Uyingizning energiya sarfini nazorat qiling, afzalliklarni belgilang va quvvatni tejash bilan birga ehtiyojlaringizga mos keladigan joydan zavqlaning.""",
    imagePath: AppImages.thirdOnBoarding,
  ),
];
