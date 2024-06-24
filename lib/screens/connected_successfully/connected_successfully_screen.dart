import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';

class ConnectedSuccessfullyScreen extends StatefulWidget {
  const ConnectedSuccessfullyScreen({
    super.key,
    required this.deviceModel,
  });

  final DeviceModel deviceModel;

  @override
  State<ConnectedSuccessfullyScreen> createState() =>
      _ConnectedSuccessfullyScreenState();
}

class _ConnectedSuccessfullyScreenState
    extends State<ConnectedSuccessfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height / 9.3,
                ),
                Center(
                  child: SvgPicture.asset(
                    AppImages.tickRoom,
                    height: 80.h,
                    width: 80.h,
                  ),
                ),
                32.getH(),
                Text(
                  'Connected!',
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 32.w,
                  ),
                ),
                12.getH(),
                Text(
                  "You have connected to ${widget.deviceModel.deviceName}.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
