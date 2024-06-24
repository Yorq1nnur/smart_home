import 'dart:async';
import 'package:smart_home/screens/countries/widgets/page_of_rich_text.dart';
import 'package:smart_home/utils/app_colors.dart';
import '../../../bloc/map/map_bloc.dart';
import '../../../bloc/map/map_event.dart';
import '../../../bloc/map/map_state.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_home/utils/size.dart';

class MapItem extends StatefulWidget {
  const MapItem({
    super.key,
  });

  @override
  State<MapItem> createState() => _MapItemState();
}

class _MapItemState extends State<MapItem> {
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            8.getH(),
            const Center(
              child: PageOfRichText(
                firstText: 'Uy manzilini ',
                secondText: "O'rnatish",
                thirdText: '',
              ),
            ),
            8.getH(),
            Text(
              "Joylashuvga asoslangan funksiyalarni yaxshilash uchun uyingiz joylashuvini belgilang. Maxfiylik bizning ustuvor vazifamizdir.",
              style: AppTextStyle.urbanistW400.copyWith(
                fontSize: 18.w,
                color: AppColors.c616161,
              ),
              textAlign: TextAlign.center,
            ),
            24.getH(),
            Container(
              height: height / 2,
              width: double.infinity,
              color: Colors.red,
              child: BlocConsumer<MapsBloc, MapsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Stack(
                    children: [
                      GoogleMap(
                        onCameraIdle: () async {
                          if (cameraPosition != null) {
                            context.read<MapsBloc>().add(
                                  GetAddressName(
                                    cameraPosition?.target as LatLng,
                                  ),
                                );
                          }
                        },
                        onCameraMove: (CameraPosition currentCameraPosition) {
                          cameraPosition = currentCameraPosition;
                          debugPrint(
                              "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                        },
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: state.userLatLng,
                          zoom: 15,
                        ),
                        onMapCreated: (GoogleMapController createdController) {
                          controller.complete(createdController);
                        },
                      ),
                      Align(
                        child: SvgPicture.asset(
                          AppImages.gps,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        left: 20, // Adjust as needed
                        bottom: 20, // Adjust as needed
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              context.read<MapsBloc>().add(
                                    GetUserLocationEvent(),
                                  );
                              final controller1 = await controller.future;
                              LatLng latLng = LatLng(
                                state.userLatLng.latitude,
                                state.userLatLng.longitude,
                              );
                              controller1.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: latLng,
                                    zoom: 15,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.my_location,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            24.getH(),
            Text(
              'Manzil tafsilotlari',
              style: AppTextStyle.urbanistW600.copyWith(
                fontSize: 18.w,
              ),
            ),
            8.getH(),
            BlocBuilder<MapsBloc, MapsState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.cFAFAFA, width: 1.w),
                    color: AppColors.cFAFAFA,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    state.addressName,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.urbanistW700.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
