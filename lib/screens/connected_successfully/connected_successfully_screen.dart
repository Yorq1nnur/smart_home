import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/routes/routes.dart';
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
                  'Muvaffaqiyatli ulandi!',
                  style: AppTextStyle.urbanistW700.copyWith(
                    fontSize: 32.w,
                  ),
                ),
                12.getH(),
                Text(
                  "Siz ${widget.deviceModel.deviceName}ga ulandingiz.",
                ),
                32.getH(),
                Image.asset(
                  widget.deviceModel.deviceImage,
                  width: width / 1.3,
                  height: height / 2.7,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: height / 9.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    _buttons.length,
                    (index) {
                      return GlobalButton(
                        onTap: () {
                          index == 0
                              ? Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RouteNames.tabBoxScreen,
                                  (predicate) => false,
                                )
                              : (){};

                          // Navigator.pushNamedAndRemoveUntil(
                          //         context,
                          //         RouteNames.tabBoxScreen,
                          //         (predicate) => false,
                          //       );
                        },
                        title: _buttons[index],
                        buttonWidth: width / 2.4,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _buttons = [
    "Bosh sahifaga qaytish",
    "Qurilmani boshqarish",
  ];
}
