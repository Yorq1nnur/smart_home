import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.isEnabled,
    required this.focusNode,
    required this.actionName,
    required this.regExp,
    required this.textInputType,
    required this.textInputAction,
    required this.isPassword,
    required this.onEyeOnTap,
    required this.prefixIcon,
    required this.hintText,
  });

  final bool isEnabled;
  final bool isPassword;
  final String prefixIcon;
  final String hintText;
  final VoidCallback onEyeOnTap;
  final FocusNode focusNode;
  final String actionName;
  final RegExp regExp;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? isEnabled : false,
      focusNode: focusNode,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please, input your $actionName!!!';
        }
        if (!regExp.hasMatch(v)) {
          return 'Please, input correct $actionName!!!';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 22.h,
          horizontal: 20.w,
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.urbanistW400.copyWith(
          fontSize: 18.w,
          color: AppColors.c9E9E9E,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: isPassword
              ? ZoomTapAnimation(
                  onTap: onEyeOnTap,
                  child: SvgPicture.asset(
                    isEnabled ? AppImages.enabledEye : AppImages.disabledEye,
                    width: 20.w,
                    height: 20.h,
                  ),
                )
              : null,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: SvgPicture.asset(
            prefixIcon,
            width: 20.w,
            height: 20.h,
          ),
        ),
        fillColor: AppColors.cFAFAFA,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.cFAFAFA,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
