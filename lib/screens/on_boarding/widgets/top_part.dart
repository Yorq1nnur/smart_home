import 'package:smart_home/utils/size.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height / 1.8,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.c405FF2),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Image.asset(
                      imagePath,
                      width: 345.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(
    Size size,
  ) {
    var path = Path();
    path.lineTo(
      0,
      size.height - 80,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(
    CustomClipper<Path> oldClipper,
  ) {
    return false;
  }
}
