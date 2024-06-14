import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/screens/auth/widgets/auth_text_field.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_constants.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isEnabled = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 28.w,
                color: Colors.black,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Join Smartify Today 👤",
              style: AppTextStyle.urbanistW700.copyWith(
                fontSize: 32.w,
                color: AppColors.c212121,
              ),
            ),
            10.getH(),
            Text(
              "Join Smartify, Your Gateway to Smart Living.",
              style: AppTextStyle.urbanistW400.copyWith(
                fontSize: 18.w,
                color: AppColors.c616161,
              ),
            ),
            32.getH(),
            Text(
              'Email',
              style: AppTextStyle.urbanistW600.copyWith(
                fontSize: 18.w,
              ),
            ),
            8.getH(),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTextField(
                    isEnabled: isEnabled,
                    focusNode: _emailFocusNode,
                    actionName: 'email',
                    regExp: AppConstants.emailRegExp,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    isPassword: false,
                    onEyeOnTap: () {
                      setState(() {
                        isEnabled = !isEnabled;
                      });
                    },
                    prefixIcon: AppImages.email,
                    hintText: 'Email',
                  ),
                  16.getH(),
                  Text(
                    'Password',
                    style: AppTextStyle.urbanistW600.copyWith(
                      fontSize: 18.w,
                    ),
                  ),
                  8.getH(),
                  AuthTextField(
                    isEnabled: isEnabled,
                    focusNode: _passwordFocusNode,
                    actionName: 'password',
                    regExp: AppConstants.passwordExp,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    isPassword: true,
                    onEyeOnTap: () {
                      setState(() {
                        isEnabled = !isEnabled;
                      });
                    },
                    prefixIcon: AppImages.email,
                    hintText: 'Password',
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
