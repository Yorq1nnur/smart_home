// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smart_home/data/models/device_model.dart';
// import 'package:smart_home/screens/global_widgets/can_not_device_item.dart';
// import 'package:smart_home/screens/global_widgets/global_button.dart';
// import 'package:smart_home/utils/app_colors.dart';
// import 'package:smart_home/utils/app_images.dart';
// import 'package:smart_home/utils/size.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import '../../utils/app_text_style.dart';
// import '../global_widgets/turn_on_set_item.dart';
//
// class ConnectToDeviceScreen extends StatefulWidget {
//   const ConnectToDeviceScreen({
//     super.key,
//     required this.deviceModel,
//   });
//
//   final DeviceModel deviceModel;
//
//   @override
//   State<ConnectToDeviceScreen> createState() => _ConnectToDeviceScreenState();
// }
//
// class _ConnectToDeviceScreenState extends State<ConnectToDeviceScreen> {
//   bool connectOnTapped = false;
//   double value = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Qurilma qo'shish",
//           style: AppTextStyle.urbanistW700.copyWith(
//             fontSize: 24.w,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             size: 28.w,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           ZoomTapAnimation(
//             child: Icon(
//               Icons.more_vert_outlined,
//               size: 28.w,
//             ),
//           ),
//           24.getW(),
//         ],
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(
//           vertical: 10.h,
//           horizontal: 24.w,
//         ),
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Text(
//             'Qurilmaga ulanish',
//             textAlign: TextAlign.center,
//             style: AppTextStyle.urbanistW700.copyWith(
//               fontSize: 24.w,
//             ),
//           ),
//           const TurnOnSetItem(),
//           connectOnTapped
//               ? const SizedBox.shrink()
//               : Text(
//                   "Chiroqni yoqing va yorug'lik tez miltillashini tasdiqlang.",
//                   style: AppTextStyle.urbanistW400.copyWith(
//                     fontSize: 18.w,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//           connectOnTapped ? const SizedBox.shrink() : 40.getH(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 AppImages.tickRoom,
//                 width: 20.w,
//                 height: 20.h,
//               ),
//               12.getW(),
//               Text(
//                 widget.deviceModel.deviceName,
//                 style: AppTextStyle.urbanistW500.copyWith(
//                   fontSize: 16.w,
//                   color: AppColors.c424242,
//                 ),
//               ),
//             ],
//           ),
//           36.getH(),
//           connectOnTapped
//               ? Center(
//                   child: SizedBox(
//                     height: height / 2.9,
//                     width: height / 2.9,
//                     child: Stack(
//                       children: [
//                         SizedBox(
//                           height: height / 2.9,
//                           width: height / 2.9,
//                           child: CircularProgressIndicator(
//                             color: AppColors.c405FF2,
//                             strokeWidth: 5.w,
//                             // value:  _getValue(),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             width: width / 2.87,
//                             height: height / 4.67,
//                             child: Image.asset(
//                               widget.deviceModel.deviceImage,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               : Center(
//                   child: Image.asset(
//                     widget.deviceModel.deviceImage,
//                     color: Colors.yellow,
//                     colorBlendMode: BlendMode.modulate,
//                     width: width / 2.87,
//                     height: height / 4.67,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//           36.getH(),
//           connectOnTapped
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Ulanmoqda...",
//                       style: AppTextStyle.urbanistW500.copyWith(
//                         fontSize: 18.w,
//                         color: AppColors.c616161,
//                       ),
//                     ),
//                     5.getH(),
//                     Text(
//                       "40%",
//                       style: AppTextStyle.urbanistW700.copyWith(
//                         fontSize: 40.w,
//                         color: AppColors.c405FF2,
//                       ),
//                     ),
//                   ],
//                 )
//               : Center(
//                   child: GlobalButton(
//                     onTap: () {
//                       setState(() {
//                         connectOnTapped = true;
//                       });
//                     },
//                     title: "Ulanish",
//                     buttonWidth: width / 2.15,
//                   ),
//                 ),
//           36.getH(),
//           CanNotDeviceItem(
//             onCanNotTap: () {},
//             onMoreInfoTap: () {},
//             canNotTitle: "Qurilmalaringizga ulanib bo‘lmadimi?",
//             moreInfoTitle: "Ko'proq ma'lumot",
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<double> _getValue() async {
//     await Future.delayed(
//       const Duration(
//         milliseconds: 100,
//       ),
//     );
//     return 3;
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/devices/devices_bloc.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/screens/global_widgets/can_not_device_item.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/routes/routes.dart';
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
  bool connectOnTapped = false;
  double value = 0.0;
  Timer? _timer;
  late VoidCallback voidCallback;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startConnecting() {
    setState(() {
      connectOnTapped = true;
      value = 0.0;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        value += 0.01;
        if (value >= 1.0) {
          value = 1.0;
          _timer?.cancel();
          voidCallback.call();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    voidCallback = () {
      context.read<DevicesBloc>().add(
            AddDeviceToDbEvent(
              widget.deviceModel,
            ),
          );
    };
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
          BlocListener<DevicesBloc, DevicesState>(
            listener: (context, state) {
              if (state.formStatus == FormStatus.success) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteNames.connectSuccessfullyScreen,
                  (predicate) => false,
                  arguments: widget.deviceModel,
                );
                context.read<DevicesBloc>().add(
                      ChangeDevicesInitialStateEvent(),
                    );
              }
            },
            child: const SizedBox.shrink(),
          ),
          Text(
            'Qurilmaga ulanish',
            textAlign: TextAlign.center,
            style: AppTextStyle.urbanistW700.copyWith(
              fontSize: 24.w,
            ),
          ),
          const TurnOnSetItem(),
          connectOnTapped
              ? const SizedBox.shrink()
              : Text(
                  "${widget.deviceModel.deviceName}ni yoqing.",
                  style: AppTextStyle.urbanistW400.copyWith(
                    fontSize: 18.w,
                  ),
                  textAlign: TextAlign.center,
                ),
          connectOnTapped ? const SizedBox.shrink() : 40.getH(),
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
          connectOnTapped
              ? Center(
                  child: SizedBox(
                    height: height / 2.9,
                    width: height / 2.9,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: height / 2.9,
                          width: height / 2.9,
                          child: CircularProgressIndicator(
                            color: AppColors.c405FF2,
                            strokeWidth: 5.w,
                            value: value,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: width / 2.87,
                            height: height / 4.67,
                            child: Image.asset(
                              widget.deviceModel.deviceImage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
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
          connectOnTapped
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ulanmoqda...",
                      style: AppTextStyle.urbanistW500.copyWith(
                        fontSize: 18.w,
                        color: AppColors.c616161,
                      ),
                    ),
                    5.getH(),
                    Text(
                      "${(value * 100).toInt()}%",
                      style: AppTextStyle.urbanistW700.copyWith(
                        fontSize: 40.w,
                        color: AppColors.c405FF2,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: GlobalButton(
                    onTap: _startConnecting,
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
