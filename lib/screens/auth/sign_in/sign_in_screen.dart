import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/screens/auth/widgets/auth_text_field.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/screens/welcome/widgets/continue_button.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_constants.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:smart_home/utils/utility_functions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isEnabled = false;
  bool terms = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back! 👋",
                style: AppTextStyle.urbanistW700.copyWith(
                  fontSize: 32.w,
                  color: AppColors.c212121,
                ),
              ),
              10.getH(),
              Text(
                "Your Smart Home, Your Rules.",
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
              16.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Ink(
                        height: 24.h,
                        width: 24.h,
                        decoration: BoxDecoration(
                          color: terms ? AppColors.c405FF2 : Colors.white,
                          border: Border.all(
                            color: AppColors.c405FF2,
                            width: 3.w,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {
                            setState(() {
                              terms = !terms;
                            });
                          },
                          child: Visibility(
                            visible: terms,
                            child: Center(
                              child: SvgPicture.asset(
                                AppImages.tick,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      16.getW(),
                      Text(
                        'Remember me',
                        style: AppTextStyle.urbanistW500.copyWith(
                          fontSize: 18.w,
                        ),
                      ),
                    ],
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyle.urbanistW600.copyWith(
                        fontSize: 18.w,
                        color: AppColors.c405FF2,
                      ),
                    ),
                  ),
                ],
              ),
              32.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 2.5,
                    child: Divider(
                      height: 1.h,
                      color: AppColors.cEEEEEE,
                    ),
                  ),
                  Text(
                    'or',
                    style: AppTextStyle.urbanistW500.copyWith(
                      fontSize: 18.w,
                      color: AppColors.c616161,
                    ),
                  ),
                  SizedBox(
                    width: width / 2.5,
                    child: Divider(
                      height: 1.h,
                      color: AppColors.cEEEEEE,
                    ),
                  ),
                ],
              ),
              10.getH(),
              ContinueButton(
                imagePath: AppImages.google,
                title: 'Continue with Google',
                onTap: () {},
              ),
              ContinueButton(
                imagePath: AppImages.apple,
                title: 'Continue with Apple',
                onTap: () {},
              ),
              ContinueButton(
                imagePath: AppImages.facebook,
                title: 'Continue with Facebook',
                onTap: () {},
              ),
              ContinueButton(
                imagePath: AppImages.twitter,
                title: 'Continue with Twitter',
                onTap: () {},
              ),
              14.getH(),
              GlobalButton(
                onTap: () {
                  setState(() {
                    _emailFocusNode.unfocus();
                    _passwordFocusNode.unfocus();
                  });
                  if (!_formKey.currentState!.validate()) {
                    UtilityFunctions.showSnackBar(
                      context: context,
                      message: 'PLEASE, INPUT ALL DATA!!!',
                      backgroundColor: Colors.red,
                    );
                  } else {
                    _emailFocusNode.unfocus();
                    _passwordFocusNode.unfocus();
                    UtilityFunctions.showAuthDialog(
                      context: context,
                      message: 'Sign in...',
                    );
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.welcomeScreen,
                        (route) => false,
                      );
                    });
                  }
                },
                title: 'Sign in',
              ),
              26.getH(),
            ],
          ),
        ),
      ),
    );
  }
}
