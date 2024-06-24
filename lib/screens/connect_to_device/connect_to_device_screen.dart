import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/screens/global_widgets/can_not_device_item.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/size.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/app_text_style.dart';
import '../global_widgets/turn_on_set_item.dart';

class ConnectToDeviceScreen extends StatefulWidget {
  const ConnectToDeviceScreen({
    super.key,
    required this.deviceModel,
  });

  final DeviceModel deviceModel;

  @override
  State<ConnectToDeviceScreen> createState() => _ConnectToDeviceScreenState();
}

class _ConnectToDeviceScreenState extends State<ConnectToDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Qurilma qo'shish",
          style: AppTextStyle.urbanistW700.copyWith(
            fontSize: 24.w,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 28.w,
            color: Colors.black,
          ),
        ),
        actions: [
          ZoomTapAnimation(
            child: Icon(
              Icons.more_vert_outlined,
              size: 28.w,
            ),
          ),
          24.getW(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 24.w,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'Qurilmaga ulanish',
            textAlign: TextAlign.center,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 24.w,
            ),
          ),
          const TurnOnSetItem(),
          Text(
            "Chiroqni yoqing va yorug'lik tez miltillashini tasdiqlang.",
            style: AppTextStyle.urbanistW400.copyWith(
              fontSize: 18.w,
            ),
            textAlign: TextAlign.center,
          ),
          40.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.tickRoom,
                width: 20.w,
                height: 20.h,
              ),
              12.getW(),
              Text(
                widget.deviceModel.deviceName,
                style: AppTextStyle.urbanistW500.copyWith(
                  fontSize: 16.w,
                  color: AppColors.c424242,
                ),
              ),
            ],
          ),
          36.getH(),
          Center(
            child: Image.asset(
              widget.deviceModel.deviceImage,
              color: Colors.yellow,
              colorBlendMode: BlendMode.modulate,
              width: width / 2.87,
              height: height / 4.67,
              fit: BoxFit.contain,
            ),
          ),
          36.getH(),
          Center(
            child: GlobalButton(
              onTap: () {},
              title: "Ulanish",
              buttonWidth: width / 2.15,
            ),
          ),
          36.getH(),
          CanNotDeviceItem(
            onCanNotTap: () {},
            onMoreInfoTap: () {},
            canNotTitle: "Qurilmalaringizga ulanib bo‘lmadimi?",
            moreInfoTitle: "Ko'proq ma'lumot",
          ),
        ],
      ),
    );
  }
}
