import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/bloc/rooms/rooms_bloc.dart';
import 'package:smart_home/data/models/room_model.dart';
import 'package:smart_home/screens/countries/widgets/page_of_rich_text.dart';
import 'package:smart_home/utils/app_colors.dart';
import 'package:smart_home/utils/app_images.dart';
import 'package:smart_home/utils/app_text_style.dart';
import 'package:smart_home/utils/size.dart';
import 'package:smart_home/utils/utility_functions.dart';

class ThirdPageItem extends StatefulWidget {
  const ThirdPageItem({super.key});

  @override
  State<ThirdPageItem> createState() => _ThirdPageItemState();
}

class _ThirdPageItemState extends State<ThirdPageItem> {
  List<int> activeIndexes = [-1, -1, -1, -1, -1, -1, -1, -1];
  List<String> rooms = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.getH(),
        const PageOfRichText(
          firstText: 'Add ',
          secondText: 'Rooms',
          thirdText: '',
        ),
        8.getH(),
        Text(
          "Select the rooms in your house. Don't worry, you can always add more later.",
          style: AppTextStyle.urbanistW400.copyWith(
            fontSize: 18.w,
            color: AppColors.c616161,
          ),
          textAlign: TextAlign.center,
        ),
        20.getH(),
        Wrap(
          children: List.generate(
            _rooms.length,
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
                      activeIndexes[index] == index
                          ? setState(() {
                              activeIndexes[index] = -1;
                            })
                          : setState(() {
                              activeIndexes[index] = index;
                            });
                      activeIndexes[index] == index
                          ? setState(() {
                              rooms.add(
                                _rooms[index].roomName,
                              );
                            })
                          : setState(() {
                              rooms.removeWhere((v) {
                                return v == _rooms[index].roomName;
                              });
                            });
                      for (String element in rooms) {
                        UtilityFunctions.methodPrint(
                          element,
                        );
                      }
                      context.read<RoomsBloc>().add(
                            AddRoomsEvent(
                              rooms,
                            ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                _rooms[index].roomImage,
                              ),
                              8.getH(),
                              Text(
                                _rooms[index].roomName,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: Visibility(
                            visible: activeIndexes[index] == index,
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
        )
      ],
    );
  }
}

final List<RoomModel> _rooms = [
  RoomModel(roomImage: AppImages.livingRoom, roomName: 'Living Room'),
  RoomModel(roomImage: AppImages.badRoom, roomName: 'Badroom'),
  RoomModel(roomImage: AppImages.bathroom, roomName: 'Bathroom'),
  RoomModel(roomImage: AppImages.kitchen, roomName: 'Kitchen'),
  RoomModel(roomImage: AppImages.studyRoom, roomName: 'Study Room'),
  RoomModel(roomImage: AppImages.diningRoom, roomName: 'Dining Room'),
  RoomModel(roomImage: AppImages.backyard, roomName: 'Backyard'),
  RoomModel(roomImage: AppImages.addNewRoom, roomName: 'Add Room'),
];
