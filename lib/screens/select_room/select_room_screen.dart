import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/rooms/rooms_bloc.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/screens/global_widgets/global_button.dart';
import 'package:smart_home/screens/routes/routes.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:smart_home/utils/utility_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key, required this.deviceModel});

  final DeviceModel deviceModel;

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  int activeIndex = -1;

  DeviceModel device = DeviceModel.initial();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.w,
          ),
        ),
        title: Text(
          'Iltimos, xonani tanlang',
          style: AppTextStyle.urbanistW900,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView(
              children: [
                BlocBuilder<RoomsBloc, RoomsState>(
                  builder: (context, state) {
                    return Wrap(
                      children: List.generate(
                        state.rooms.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            child: Ink(
                              height: 106.h,
                              width: 183.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.cFAFAFA,
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  setState(() {
                                    activeIndex == index
                                        ? activeIndex = -1
                                        : activeIndex = index;
                                  });
                                  setState(() {
                                    activeIndex != index
                                        ? device = widget.deviceModel.copyWith(
                                            roomName: '',
                                          )
                                        : device = widget.deviceModel.copyWith(
                                            roomName: state.rooms[index],
                                          );
                                  });
                                  UtilityFunctions.methodPrint(
                                    device.toString(),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            state.roomImages[index],
                                          ),
                                          8.getH(),
                                          Text(
                                            state.rooms[index],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 10.w,
                                      top: 10.h,
                                      child: Visibility(
                                        visible: activeIndex == index,
                                        child: SvgPicture.asset(
                                          AppImages.tickRoom,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          GlobalButton(
            onTap: () {
              activeIndex != -1
                  ? Navigator.pushNamed(
                      context,
                      RouteNames.connectToDeviceScreen,
                      arguments: device,
                    )
                  : UtilityFunctions.showSnackBar(
                      context: context,
                      message:
                          "ILTIMOS, QURILMA TEGISHLI BO'LGAN XONANI TANLANG!!!",
                      backgroundColor: Colors.red,
                    );
            },
            title: 'Davom etish',
          ),
          20.getH(),
        ],
      ),
    );
  }
}
